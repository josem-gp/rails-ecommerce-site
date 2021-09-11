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
        t = Time.now()
        time = t.strftime("%Y-%m-%d %H:%M:%S")
        @order.update(status: 2, date: time)
        if @order.update
            ShippingConfirmationMailer.with(user: current_user, order: @order).shipping_confirmation_email.deliver_later
            redirect_to root_path, notice: "Thank you for your order!"
        else
            redirect_to root_path, notice: "Product not ordered, please try again"
        end
    end
end
