require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model initialization' do
    context "when not valid" do
      let!(:correct_user) { FactoryBot.create(:non_admin_user, email: "jose_test@test.io", username: "jose_test") }

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

    context "when valid" do
      it 'is succesfully create' do
        expect(FactoryBot.create(:non_admin_user)).to be_valid
      end
    end
  end
  describe '#add_default_icon' do
    it 'attaches default icon to user' do
      expect(FactoryBot.build(:non_admin_user).icon.name).to eq("default_icon")
    end
  end

  describe '#join_newsletter' do
    let(:correct_user) { FactoryBot.create(:non_admin_user) }
    it 'adds user to newsletter' do
      expect(correct_user.email).to eq(Newsletter.first.email)
    end
  end

  describe '#send_registration_email' do
    let!(:correct_user) { FactoryBot.create(:non_admin_user) }
    it 'generates mail upon user creation' do
      expect { FactoryBot.create(:non_admin_user) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'sends mail to user email' do
      expect(ActionMailer::Base.deliveries.last.to[0]).to eq("#{correct_user.email}")
    end
  end
end