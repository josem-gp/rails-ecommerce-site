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
                @order_items_count = OrderItem.where(order_id: @order.id).count
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
        @operator = params[:operator]
        @product = Product.find(params[:"data-id"])
        authorize @order_item
        if @operator == 'plus'
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
            format.html { redirect_to new_charge_path }
            format.js 
        end
    end

    def destroy
        @order = Order.find(params[:order])
        @order_item = OrderItem.find(params[:id])
        authorize @order_item
        @order_item.delete
        @total = Order.update_total(@order)
        @product = Product.find(params[:"data-id"])
        if @order.update(total: @total)
          @order_items_count = OrderItem.where(order_id: @order.id).count
          respond_to do |format|
              format.html { redirect_to new_charge_path }
              format.js 
          end
        else 
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    private

    def order_items_params
        #for product_id to work, we passed @product.id
        #this is both for the products cards (only product_id will be passed) 
        #and also por the product show page (both product_id and quantity will be passed)
        params[:order_item] ? params.require(:order_item).permit(:quantity, :product_id) : nil
    end
end