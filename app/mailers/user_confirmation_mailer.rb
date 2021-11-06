class UserConfirmationMailer < ApplicationMailer

    def user_registration_email
        @user = params[:user]
        @featured_products =Product.order(sales: :desc).first(3)

        mail(to: @user.email, subject: "Welcome to #{ENV['SHOP_NAME']}")
    end
end
