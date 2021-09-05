class OrdersController < ApplicationController
    def edit
        @order = Order.find(params[:id])
        @total = Order.update_total(@order)
        if @order.update(total: @total)
            redirect_to request.referrer
        else 
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end

    def update
        @order = Order.find(params[:id])
        @order.update(status: 2)
        redirect_to root_path, notice: "Thank you for your order!"
    end
end
