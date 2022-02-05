require 'rails_helper'

RSpec.feature "Catalog interactions", type: :feature do

    let(:user) { FactoryBot.create(:non_admin_user) }
    let!(:product) { FactoryBot.create(:correct_product) }

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

        if product.rating == 1.0
            expect(page).to have_selector("div[data-stars='#{product.rating}']", visible: true)
        else
            expect(page).to have_selector("div[data-stars='#{product.rating}']", visible: false)
        end
    end

    scenario "organizes products by rating 5 - 1" do

    end

    # scenario "organizes products by rating 1 - 5" do

    # end
end

### Catalog page 
# Visitor clicks clicks cart on product --> redirected to sign up
# User or visitor filters by rating or money
# User or visitor organizes products by rating 5 - 1 (check that the first card has bigger number than last card)
# User or visitor organizes products by rating 1 - 5 (check that the first card has smaller number than last card)