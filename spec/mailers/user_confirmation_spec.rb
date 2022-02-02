require "rails_helper"

RSpec.describe UserConfirmationMailer, type: :mailer do
  describe "notify" do
    let(:mail) { UserConfirmationMailer.with(user: FactoryBot.create(:non_admin_user)).user_registration_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome to ")
      expect(mail.to).to eq(["jose_test1@test.io"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Welcome!")
    end
  end
end
