class OrderItemsController < ApplicationController
    def create
        @product = Product.find(params[:product_id])
        @order = OrderItem.generate_order(current_user)
        @order_item = OrderItem.new
        @order_item.product = @product
        @order_item.order = @order
        if @order_item.save
            redirect_to edit_order_path(@order)
        else
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    def delete
    end
end