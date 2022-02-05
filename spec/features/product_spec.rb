require 'rails_helper'

RSpec.feature "Product interactions", type: :feature do

    let(:user) { FactoryBot.create(:non_admin_user) }

    let(:product) { FactoryBot.create(:correct_product) }

    scenario "visitor clicks on write a review" do
        visit "/products/#{product.id}"

        find("#profile-tab").click

        within "#profile" do
            find("a").click
        end

        expect(page).to have_current_path "/users/sign_in"
    end

    # scenario "user writes review successfully" do

    # end

    # scenario "user writes review unsuccessfully" do

    # end
end