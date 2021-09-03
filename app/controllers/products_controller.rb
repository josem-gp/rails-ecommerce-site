class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index, :show ]

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
        @reviews = @product.reviews
        @review = Review.new
        @admin = User.find_by(username: "josegp_admin")
        if params[:user_id]
            @user = User.find(params[:user_id])
        else
            @user = current_user
        end
    end
end
