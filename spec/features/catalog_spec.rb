require 'rails_helper'

RSpec.feature "Catalog interactions", type: :feature do

    let(:user) { FactoryBot.create(:non_admin_user) }

    # To give each product in the list a different rating
    let!(:product) do 
        FactoryBot.create_list(:correct_product, 2).each_with_index do |product, i|
            product.update(rating: i + 1) #need to do update so that the data persists
        end
    end

    scenario "user clicks cart icon on product", js:true do

        login_as(user)

        visit products_path

        page.driver.browser.manage.window.maximize #if I dont do this, it will give an error of Selenium::WebDriver::Error::MoveTargetOutOfBoundsError:
        find(".mini-product-card", match: :first).hover
        expect(page).to have_selector('.info-hover', visible: true)
        find(:xpath, "/html/body/main/section[2]/div/div/div[2]/div[2]/div[1]/div[1]/div[2]/a", :visible => false).click
        
        expect(page).to have_css(".items-cart", text: "1")
    end

    scenario "visitor clicks cart icon on product", js:true do

        visit products_path

        page.driver.browser.manage.window.maximize #if I dont do this, it will give an error of Selenium::WebDriver::Error::MoveTargetOutOfBoundsError:
        find(".mini-product-card", match: :first).hover
        expect(page).to have_selector('.info-hover', visible: true)
        find(:xpath, "/html/body/main/section[2]/div/div/div[2]/div[2]/div[1]/div[1]/div[2]/a", :visible => false).click
        
        expect(page).to have_current_path "/users/sign_in"

    end

    scenario "filters products by rating" do

        visit products_path

        within "li[data-stars='1.0']" do
            find(".box").click
        end

        expect(page).to have_selector("div[data-stars='#{product.first.rating}']", visible: true)
        expect(page).to have_selector("div[data-stars='#{product[1].rating}']", visible: false)
    end

    scenario "organizes products by rating 5 - 1" do

        visit products_path

        find(".sort_drop").click

        within ".made-dropdown-menu" do
            find(".dropdown-item[href='/products?sort_by=rating+5-1']").click
        end

        expect(page).to have_selector(".wrapper-right .mini-product-card:nth-child(1)[data-stars='#{product[1].rating}']")
    end
end