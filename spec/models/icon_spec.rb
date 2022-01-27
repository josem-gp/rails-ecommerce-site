require 'rails_helper'

RSpec.describe Icon, type: :model do
  describe "icon model initialization" do
    context "when not valid" do
      it "lacks url" do 
        expect(FactoryBot.build(:icon)).to_not be_valid
      end

      it "url not part of IMAGES" do 
        expect(FactoryBot.build(:incorrect_url_icon)).to_not be_valid
      end

      it "lacks name" do 
        expect(FactoryBot.build(:non_name_icon)).to_not be_valid
      end
    end

    context "when valid" do
      it 'is succesfully created' do
        expect(FactoryBot.create(:correct_url_icon)).to be_valid
      end
    end
  end
end
