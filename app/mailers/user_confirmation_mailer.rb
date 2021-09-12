class UserConfirmationMailer < ApplicationMailer
    def user_registration_email
        @user = params[:user]

        mail(to: @user.email, subject: "Welcome to #{ENV['SHOP_NAME']}")
    end
end
