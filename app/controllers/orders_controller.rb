class OrdersController < ApplicationController
    def update(user=nil, order=nil)
        if user && order
            @user = user
            @order = order
            t = Time.now()
            time = t.strftime("%Y-%m-%d %H:%M:%S")
            if @order.update(status: 2, date: time, client_shipping_address: user.shipping_address , client_name: user.name)
                ShippingConfirmationMailer.with(user: @user, order: @order).shipping_confirmation_email.deliver_later
            end
        else
            @order = Order.find(params[:id])
            authorize @order
            @order.update(billing_params)
            billing_params[:checked] ? @order.update(checked: billing_params[:checked].to_i) : ""
            redirect_to new_charge_path
        end
    end

    private
    def billing_params
        params.require(:order).permit(:billing_address, :checked)
    end
end
