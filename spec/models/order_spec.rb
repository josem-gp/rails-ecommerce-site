require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "order model initialization" do
    context "when not valid" do
      it "lacks a status" do
        expect(FactoryBot.build(:non_status_order)).to_not be_valid
      end
      it "doesnt have a status between 1 and 2" do
        incorrect_status_order = FactoryBot.build(:non_status_order, status: 3)
        incorrect_status_order.valid?
        expect(incorrect_status_order.errors[:status]).to include("must be less than or equal to 2")
      end
      it "lacks a date" do
        expect(FactoryBot.build(:non_date_order)).to_not be_valid
      end
      it "lacks total value" do
        expect(FactoryBot.build(:non_total_order)).to_not be_valid
      end
      it "doesnt have an integer as total value" do
        incorrect_total_order = FactoryBot.build(:non_total_order, total: "test")
        incorrect_total_order.valid?
        expect(incorrect_total_order.errors[:total]).to include("is not a number")
      end
    end
    context "when valid" do
      it 'is succesfully created' do
        expect(FactoryBot.create(:correct_order)).to be_valid
      end
    end
  end
  describe "#add_billing_address" do
    let(:random_order) { FactoryBot.create(:correct_order) }
    it "updates shipping address of user" do
      expect(random_order.billing_address).to eq(random_order.user.shipping_address)
    end
  end
end

# After save Order --> most_featured
# After save Order --> merge_order_items
# .update_total(order)