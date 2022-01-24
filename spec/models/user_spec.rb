require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user model initialization' do
    context "when not valid" do
        it 'lacks username' do
            expect(FactoryBot.build(:non_username_user)).to_not be_valid
        end

        it 'lacks email' do
            expect(FactoryBot.build(:non_email_user)).to_not be_valid
        end
    end

    context "when valid" do

    end
  end
  describe 'user model methods' do

  end
end

# User needs to have username
# User needs to have unique username (case sensitive - false)
# User needs to have username with minimun length of 3
# User needs to have email
# User needs to have unique email
# User gets icon before validation
# User is added to newsletter after creation
# User gets a confirmation email after creation