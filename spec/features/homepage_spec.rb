require 'rails_helper'

RSpec.feature "Homepage interactions", type: :feature do
  let(:current_user) { FactoryBot.create(:non_admin_user) }
  scenario "visitor clicks on cart on featured products" do 
    visit root_path
    # find("a[href='/users/sign_in']").click
    sleep 5
    save_and_open_page
    find(:xpath, "/html/body/main/section[2]/div/div[3]/div/div/div/div[1]/div[2]/a").click


    expect(page).to have_current_path "/users/sign_in"
  end

  scenario "user clicks on cart on featured products" do 
    # login_as(current_user)
    # visit root_path
    # find(:xpath, "/html/body/main/section[2]/div/div[3]/div/div/div/div[1]/div[2]/a").click
    # cart_icon = page.find('.info-hover').value

    # expect(cart_icon).to eq('1')
  end

  scenario "visitor/user sends incomplete contact form" do 
  end

  scenario "visitor/user sends complete contact form" do 
  end

  scenario "visitor/user joins newsletter with correct email" do 
  end

  scenario "visitor/user joins newsletter with incorrect email" do 
  end
end