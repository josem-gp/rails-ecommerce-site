class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]
#  before_action :controller_name, only: [:show ]

    def index
        @user = current_user
        if params[:query].present?
            @products_highlight = policy_scope(Product).search_by_name_and_description(params[:query]).with_pg_search_highlight
        else
            @products = policy_scope(Product)
        end
    end

    def create
        @product = Product.new(product_params)
        if current_user.admin
            @user = current_user
            @product.user = @user
            authorize @product
            @product.save!
        else 
            redirect_to root_path
        end 
        redirect_to products_path
    end

    def show
        @product = Product.find(params[:id])
        @reviews = @product.reviews
        @order_item = OrderItem.new
        @review = Review.new
        @admin = User.find_by(admin: true)
        if params[:user_id]
            @user = User.find(params[:user_id])
        else
            @user = current_user
        end
        authorize @product
    end

    def toggle_favorite
        @product = Product.find_by(id: params[:id])
        current_user.favorited?(@product) ? current_user.unfavorite(@product) : current_user.favorite(@product)
        redirect_to request.referrer #this will take the path we were at before the current path (products#toggle_favorite)
        authorize @product
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price, :availability, photos: [])
    end

    def controller_name
        raise
        # the idea is to get params[:id] and if it is a name then check if it is capitalized or uppercased and if thats the case redirect to lowercase path
        #to check the path we can use request.path. Also keep in mind that sometimes the params[:id] is downcase but whats before has the uppercase so we can just downcase the whole url?
        # ['2Arfasd4', 'Computology', 'app', '123', "A2dadf4"].map { |el| /[[:digit:]]/.match(el) ? "yes"  : "no" } => ["yes", "no", "no", "yes", "yes"]
        # request.path.split("/").map { |el| /[[:digit:]]/.match(el) ? el  : el.downcase }.join("/") => "/products/138"
        unless request.path.split("/").select{|el| el.match(/^[[:upper:]][a-zA-Z]+/)}.blank?
            redirect_to request.path.split("/").map { |el| /[[:digit:]]/.match(el) ? el  :  el == "" ? "" : el.downcase}.join("/"), :status => :moved_permanently
        end

    end
end
