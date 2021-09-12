class ShippingConfirmationMailer < ApplicationMailer
    # default from: 'myfakestore@email.com'

    def shipping_confirmation_email
        @user = params[:user]
        @order = params[:order]

        mail(to: @user.email, subject: "Your shipment is on it's way")
    end
end
