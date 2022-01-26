# Preview all emails at http://localhost:3000/rails/mailers/user_confirmation
class UserConfirmationPreview < ActionMailer::Preview
    def user_registration_email
        user = User.new(username: "saki_test", email: "saki@hotmail.com", password: "1234567")

        UserConfirmationMailer.with(user: user).user_registration_email
    end
end
