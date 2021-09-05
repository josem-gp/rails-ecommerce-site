class OrderItemsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        @order = OrderItem.generate_order(current_user)
        @order_item = OrderItem.new
        @order_item.product = @product
        @order_item.order = @order
        if @order_item.save!
            redirect_to cart_path
        else
            redirect_to root_path
        end
#if this doesnt work then create the whole logic here instead of in the model

    end

    def delete
    end
end