class ShippingConfirmationMailer < ApplicationMailer
    # default from: 'myfakestore@email.com'

    def shipping_confirmation_email
        @user = params[:user]
        @order = params[:order]
        @order_items = OrderItem.where(order_id: @order.id)

        mail(to: @user.email, subject: "Your shipment is on it's way")
    end
end
