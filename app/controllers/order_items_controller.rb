class OrderItemsController < ApplicationController
    def create
        @order = OrderItem.generate_order(current_user)
        if order_items_params
            @order_item = OrderItem.new(order_items_params)
        else
            @order_item = OrderItem.new(quantity: 1, product_id: params[:product_id])
        end
        @order_item.order = @order
        authorize @order_item
        if @order_item.save
            @total = Order.update_total(@order)
            if @order.update(total: @total)
                respond_to do |format|
                    format.html { redirect_to request.referrer }
                    format.js 
                end
            else 
                redirect_to root_path, notice: "Product not ordered, please try again"
            end
        else
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    def update
        @order_item = OrderItem.find(params[:id])
        @item_quantity = OrderItem.find(params[:id]).quantity
        @order = OrderItem.generate_order(current_user)
        authorize @order_item
        if params[:format] == 'plus'
            @new_quantity = @item_quantity + 1
            @order_item.update({quantity: @new_quantity})
            @total = Order.update_total(@order)
            @order.update(total: @total)
        else
            if @item_quantity > 0
                @new_quantity = @item_quantity - 1
                @order_item.update({quantity: @new_quantity})
                @total = Order.update_total(@order)
                @order.update(total: @total)
            end
        end
        respond_to do |format|
            format.js 
            format.html { redirect_to new_charge_path }
        end
    end

    def destroy
        @order = Order.find(params[:order])
        @order_item = OrderItem.find(params[:id])
        authorize @order_item
        @order_item.delete
        @total = Order.update_total(@order)
        if @order.update(total: @total)
            respond_to do |format|
                format.html { redirect_to request.referrer }
                format.js 
            end
        else 
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    private

    def order_items_params
        #for product_id to work, we passed @product.id
        params[:order_item] ? params.require(:order_item).permit(:quantity, :product_id) : nil
    end
end