class OrderItemsController < ApplicationController
    def create
        @order = OrderItem.generate_order(current_user)
        @order_item = OrderItem.new(order_items_params)
        @order_item.order = @order
        raise
        if @order_item.save
            redirect_to edit_order_path(@order)
        else
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    def destroy
        @order = Order.find(params[:order])
        @order_item = OrderItem.find(params[:id])
        @order_item.delete
        redirect_to edit_order_path(@order)
    end

    private

    def order_items_params
        #for product_id to work, we passed @product.id
        params.require(:order_item).permit(:quantity, :product_id)
    end
end