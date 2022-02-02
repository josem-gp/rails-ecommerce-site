require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "review model initialization" do
    context "when not valid" do
      it "lacks a title" do
        expect(FactoryBot.build(:non_title_review)).to_not be_valid
      end
      it "lacks a content" do
        expect(FactoryBot.build(:non_content_review)).to_not be_valid
      end
      it "doesnt have a content between 3 and 250 char" do
        incorrect_content_review = FactoryBot.build(:incorrect_content_review)
        incorrect_content_review.valid?
        expect(incorrect_content_review.errors[:content]).to include("is too short (minimum is 3 characters)")
      end
      it "lacks rating" do
        expect(FactoryBot.build(:non_rating_review)).to_not be_valid
      end
      it "doesnt have a rating between 1 and 5 char" do
        incorrect_rating_review = FactoryBot.build(:incorrect_rating_review)
        incorrect_rating_review.valid?
        expect(incorrect_rating_review.errors[:rating]).to include("must be less than or equal to 5")
      end
    end
    context "when valid" do
      it 'is succesfully created' do
        expect(FactoryBot.create(:correct_review)).to be_valid
      end
    end
  end
  describe "#add_rating_to_product" do
    let(:mock_review_1)  { FactoryBot.create(:correct_review, rating: 3) }
    let(:mock_review_2)  { FactoryBot.create(:correct_review, rating: 5, product_id: mock_review_1.product.id) }

    it "updates overall review rating of a product" do
      expect(mock_review_2.product.rating).to eq(4.0)
    end
  end
end