require "rails_helper"

RSpec.describe ShippingConfirmationMailer, type: :mailer do
  describe "notify" do
    let(:correct_order) { FactoryBot.create(:correct_order) }
    let(:mail) { ShippingConfirmationMailer.with(user: correct_order.user, order: correct_order).shipping_confirmation_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Your shipment is on it's way")
      expect(mail.to).to eq([correct_order.user.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Shipping confirmation")
    end
  end
end
