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

    scenario "user writes review unsuccessfully" do

        login_as(user)

        visit "/products/#{product.id}"

        find("#profile-tab").click

        within "#profile" do
            find(".modal-btn").click
        end

        find("#review_rating_3", visible: false).click
        fill_in "review_title", with: "Test Review"
        click_button "Submit review"
        
        expect(page).to have_content("There was an error in your form")
    end

    scenario "user writes review successfully" do

        login_as(user)

        visit "/products/#{product.id}"

        find("#profile-tab").click

        within "#profile" do
            find(".modal-btn").click
        end

        expect{
            find("#review_rating_3", visible: false).click
            fill_in "review_title", with: "Test Review"
            fill_in "review_content", with: "Test content review"
            click_button "Submit review"
        }.to change(user.reviews, :count).by(1)
    end
end