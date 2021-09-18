class OrdersController < ApplicationController
    def edit(order = nil)
        if order.nil?
            @order = Order.find(params[:id])
            @total = Order.update_total(@order)
            if @order.update(total: @total)
                redirect_to request.referrer
            else 
                redirect_to root_path, notice: "Product not ordered, please try again"
            end
        else
            @order = order
            @total = Order.update_total(@order)
            @order.update(total: @total)
        end
    end

    def update(user, order)
        @user = user
        @order = order
        t = Time.now()
        time = t.strftime("%Y-%m-%d %H:%M:%S")
        if @order.update(status: 2, date: time)
            ShippingConfirmationMailer.with(user: @user, order: @order).shipping_confirmation_email.deliver_later
        end
    end
end
