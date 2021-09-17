class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @user = current_user
        if params[:query].present?
            @products = Product.search_by_name_and_description(params[:query])
        else
            @products = Product.all
        end
    end

    def show
        @user = current_user
        @product = Product.find(params[:id])
        @reviews = @product.reviews
        @order_item = OrderItem.new
        @review = Review.new
        @admin = User.find_by(username: "josegp_admin")
        if params[:user_id]
            @user = User.find(params[:user_id])
        else
            @user = current_user
        end
    end

    def toggle_favorite
        @product = Product.find_by(id: params[:id])
        current_user.favorited?(@product) ? current_user.unfavorite(@product) : current_user.favorite(@product)
        redirect_to request.referrer #this will take the path we were at before the current path (products#toggle_favorite)
    end
end
