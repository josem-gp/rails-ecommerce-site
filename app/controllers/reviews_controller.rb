class ReviewsController < ApplicationController
    def create
        @user = current_user
        @product = Product.find(params[:product_id])
        @review = Review.new(review_params)
        @review.user = @user
        @review.product = @product
        if @review.save
            redirect_to product_path(@product)
        else
            redirect_to root_path
        end
    end

    def update 
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        @review.update(review_params)
        redirect_to product_path(@product)
    end
    def destroy
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :rating)
    end
end
