require 'rails_helper'

RSpec.feature "Homepage interactions", type: :feature do
  scenario "send incomplete contact form", js:true do
    visit root_path

    within(".new_contact") do
      fill_in "contact_name", with: "Test User"
      fill_in "contact_message", with: "Trying out Capybara"
      click_button "Send Message"
    end

    expect(page).to_not have_text('Thank you for your message.')
  end

  scenario "send contact form with incorrect email", js:true do
    visit root_path

    within(".new_contact") do
      fill_in "contact_name", with: "Test User"
      fill_in "contact_email", with: "asdfadsd"
      fill_in "contact_message", with: "Trying out Capybara"
      click_button "Send Message"
    end

    expect(page).to have_text('Message did not send.')
  end

  scenario "send contact form correctly" do 
    visit root_path

    within(".new_contact") do
      fill_in "contact_name", with: "Test User"
      fill_in "contact_email", with: "mail@test.io"
      fill_in "contact_message", with: "Trying out Capybara"
      click_button "Send Message"
    end

    expect(page).to have_text('Thank you for your message.')
  end

  scenario "visitor/user joins newsletter with correct email" do 
  end

  scenario "visitor/user joins newsletter with incorrect email" do 
  end
end