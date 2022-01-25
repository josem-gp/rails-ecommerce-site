require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model initialization' do
    context "when not valid" do
      let!(:correct_user) { FactoryBot.create(:non_admin_user, email: "jose_test@test.io") }

      it 'lacks username' do
        expect(FactoryBot.build(:non_username_user)).to_not be_valid
      end

      it 'lacks email' do
        expect(FactoryBot.build(:non_email_user)).to_not be_valid
      end

      it 'username duplicated' do
        incorrect_user_1 = FactoryBot.build(:non_admin_user, username: "Jose_Test")
        incorrect_user_1.valid?
        expect(incorrect_user_1.errors[:username]).to include("has already been taken")
      end

      it 'username shorter than 3 characters' do
        incorrect_user_1 = FactoryBot.build(:non_admin_user, username: "Jo")
        incorrect_user_1.valid?
        expect(incorrect_user_1.errors[:username]).to include("is too short (minimum is 3 characters)")
      end

      it 'email duplicated' do
        incorrect_user_1 = FactoryBot.build(:non_admin_user, email: "Jose_test@test.io")
        incorrect_user_1.valid?
        expect(incorrect_user_1.errors[:email]).to include("has already been taken")
      end
    end
  end
  describe 'user model methods' do

  end
end

# User gets icon before validation
# User is added to newsletter after creation
# User gets a confirmation email after creation