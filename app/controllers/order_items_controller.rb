class OrderItemsController < ApplicationController
    def create
        @order = OrderItem.generate_order(current_user)
        @order_item = OrderItem.new(order_items_params)
        @order_item.order = @order
        if @order_item.save
            redirect_to edit_order_path(@order)
        else
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    def update
        @order_item = OrderItem.find(params[:id])
        @item_quantity = OrderItem.find(params[:id]).quantity
        @order = OrderItem.generate_order(current_user)
        if params[:format] == 'plus'
            @new_quantity = @item_quantity + 1
            @order_item.update({quantity: @new_quantity})
            orders_controller = OrdersController.new
            orders_controller.edit(@order)
        else
            if @item_quantity > 0
                @new_quantity = @item_quantity - 1
                @order_item.update({quantity: @new_quantity})
                orders_controller = OrdersController.new
                orders_controller.edit(@order)
            end
        end
        redirect_to new_charge_path
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