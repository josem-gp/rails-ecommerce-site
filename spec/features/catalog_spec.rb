require 'rails_helper'

RSpec.feature "Catalog interactions", type: :feature do

    let(:user) { FactoryBot.create(:non_admin_user) }
    let!(:product) { FactoryBot.create_list(:correct_product, 3) }

    scenario "user clicks cart icon on product", js:true do
        login_as(user)

        visit products_path

        page.driver.browser.manage.window.maximize #if I dont do this, it will give an error of Selenium::WebDriver::Error::MoveTargetOutOfBoundsError:
        find(".mini-product-card", match: :first).hover
        expect(page).to have_selector('.info-hover', visible: true)
        find(:xpath, "/html/body/main/section[2]/div/div/div[2]/div[2]/div[1]/div[1]/div[2]/a", :visible => false).click
        
        # wait_for_ajax

        expect(page).to have_css(".items-cart", text: "1")
    end

    # scenario "visitor clicks cart icon on product" do

    # end

    # scenario "filters products by money" do

    # end

    # scenario "organizes products by rating 5 - 1" do

    # end

    # scenario "organizes products by rating 1 - 5" do

    # end
end

### Catalog page 
# Visitor clicks clicks cart on product --> redirected to sign up
# User or visitor filters by rating or money
# User or visitor organizes products by rating 5 - 1 (check that the first card has bigger number than last card)
# User or visitor organizes products by rating 1 - 5 (check that the first card has smaller number than last card)