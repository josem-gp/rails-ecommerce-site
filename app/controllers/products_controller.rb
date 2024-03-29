class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @user = current_user
        if params[:query].present?
            @products_highlight = policy_scope(Product).search_by_name_and_description(params[:query]).with_pg_search_highlight
            @featured_products =Product.order(sales: :desc).first(3)
        else
            @products = policy_scope(Product.order_list(params[:sort_by]))
            @featured_products =Product.order(sales: :desc).first(3)
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
        @related_products = Product.order(rating: :desc).first(4)
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
        authorize @product
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js 
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price, :availability, photos: [])
    end
end
