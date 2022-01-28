require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "product model initialization" do
    context "when not valid" do
      it "lacks name" do
        expect(FactoryBot.build(:correct_product, name: nil)).to_not be_valid
      end

      it "has duplicated name" do
        correct_product = FactoryBot.create(:correct_product, name: "Product_test")
        repeated_name = FactoryBot.build(:correct_product, name: "product_Test")
        repeated_name.valid?
        expect(repeated_name.errors["name"]).to include("has already been taken")
      end

      it "lacks description" do
        expect(FactoryBot.build(:correct_product, description: nil)).to_not be_valid
      end

      it "lacks price" do
        expect(FactoryBot.build(:correct_product, price: nil)).to_not be_valid
      end

      it "price is not integer" do
        incorrect_product_1 = FactoryBot.build(:correct_product, price: "test")
        incorrect_product_1.valid?
        expect(incorrect_product_1.errors["price"]).to include("is not a number")
      end

      it "lacks availability" do
        expect(FactoryBot.build(:correct_product, availability: nil)).to_not be_valid
      end

      it "availability not between 1 or 2" do
        incorrect_product_1 = FactoryBot.build(:incorrect_product)
        incorrect_product_1.valid?
        expect(incorrect_product_1.errors["availability"]).to include("must be less than or equal to 2")
      end
    end

    context "when valid" do
      it 'is succesfully created' do
        expect(FactoryBot.create(:correct_product)).to be_valid
      end
    end
  end
  describe "#initial_sales" do
    it "is 0 when product is created" do
      correct_product = FactoryBot.create(:correct_product)
      expect(correct_product.sales).to eq(0)
    end
  end
  describe ".order_list" do
    let!(:first_product) { FactoryBot.create(:correct_product, name: "First Product" , rating: 1) }
    let!(:second_product) { FactoryBot.create(:correct_product, name: "Second Product" , rating: 2) }
    let!(:third_product) { FactoryBot.create(:correct_product, name: "Third Product" , rating: 3) }

    it "orders products according to param" do
      mock_member = double
      puts "Mock #{mock_member}"
      first_product_1 = first_product.instance_variable_set(:@another_member, mock_member)
      puts "The list #{first_product_1}"
      # ordered_list = Product.order_list('rating 1-5')
      # puts "Ordered list #{ordered_list}"
      # expect(ordered_list.all).to eq[third_product, second_product, first_product]
    end
  end
end

# When Product.order_list is used, the list of products is ordered depending the param that is passed