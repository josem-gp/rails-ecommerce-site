class OrdersController < ApplicationController
    def edit
        @order = Order.find(params[:id])
        @total = Order.update_total(@order)
        if @order.update(total: @total)
            redirect_to request.referrer, notice: "Product ordered succesfully"
        else 
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end
end
