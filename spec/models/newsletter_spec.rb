require 'rails_helper'

RSpec.describe Newsletter, type: :model do
  describe "newsletter model initialization" do
    context "when not valid" do
      let!(:correct_newsletter) { FactoryBot.create(:correct_newsletter) }
      it "lacks email" do 
        expect(FactoryBot.build(:non_email_newsletter)).to_not be_valid
      end

      it "has duplicated email" do 
        correct_newsletter_1 = FactoryBot.build(:correct_newsletter, email: "Email@test.io")
        correct_newsletter_1.valid?
        expect(correct_newsletter_1.errors[:email]).to include("has already been taken")
      end
    end

    context "when valid" do
      it 'is succesfully created' do
        expect(FactoryBot.create(:correct_newsletter)).to be_valid
      end
    end
  end
end
