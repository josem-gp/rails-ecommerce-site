class ReviewsController < ApplicationController

    def create
        @user = current_user
        @product = Product.find(params[:product_id])
        @review = Review.new(review_params)
        @review.user = @user
        @review.product = @product
        authorize @review
        if @review.save
            redirect_to product_path(@product)
        else
            # raise
            # redirect_to product_path(@product), notice: "There was an error in your form"
            render 'products/show'
        end
    end

    def update 
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        authorize @review
        @review.update(review_params)
        redirect_to product_path(@product)
        
    end
    def destroy
        @product = Product.find(params[:product_id])
        @review = Review.find(params[:id])
        authorize @review
        @review.destroy
        redirect_to product_path(@product)
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :rating)
    end
end
