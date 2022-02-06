require 'rails_helper'

RSpec.feature "User profile interactions", type: :feature do

    scenario "user likes a product" do
        user = FactoryBot.create(:non_admin_user)
        product = FactoryBot.create(:correct_product)

        login_as(user)

        visit "/products/#{product.id}"

        within("#favoritor") do
            find("a").click
        end

        visit "/users/#{user.id}"

        expect(page).to have_content("#{product.name}")
    end

    scenario "user makes an order" do

        order = FactoryBot.create(:correct_order) 
        user = order.user

        login_as(user)

        visit "/users/#{user.id}"
        find("#orders-tab").click

        expect(page).to have_content("#{order.total}")   
    end
end