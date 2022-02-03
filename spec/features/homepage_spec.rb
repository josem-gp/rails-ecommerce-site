require 'rails_helper'

RSpec.feature "Homepage interactions", type: :feature do
  scenario "sends contact form with incorrect email", js:true do
    visit root_path

    within(".new_contact") do
      fill_in "contact_name", with: "Test User"
      fill_in "contact_email", with: "test"
      fill_in "contact_message", with: "Trying out Capybara"
      click_button "Send Message"
    end

    expect(page).to have_text('Message did not send.')
  end

  scenario "sends incomplete contact form", js:true do
    visit root_path

    within(".new_contact") do
      fill_in "contact_name", with: "Test User"
      fill_in "contact_message", with: "Trying out Capybara"
      click_button "Send Message"
    end

    expect(page).to_not have_text('Thank you for your message.')
  end

  scenario "sends contact form correctly" do 
    visit root_path

    within(".new_contact") do
      fill_in "contact_name", with: "Test User"
      fill_in "contact_email", with: "mail@test.io"
      fill_in "contact_message", with: "Trying out Capybara"
      click_button "Send Message"
    end

    expect(page).to have_text('Thank you for your message.')
  end

  scenario "joins newsletter with incorrect email" do 
    visit root_path

    within(".input-group") do
      fill_in "email", with: "Test Email"
      find('.fa-paper-plane input').click
    end

    expect(page).to have_text('There was an error in your form')
  end

  scenario "joins newsletter with correct email" do 
    visit root_path

    within(".input-group") do
      fill_in "email", with: "mail@test.io"
      find('.fa-paper-plane input').click
    end

    expect(page).to have_text('Thank you for subscribing to our newsletter!')
  end
end

### Sign up / Log in 
# User logs in (succesfully)
# User logs in (unsuccesfully)
# Visitor signs up (succesfully)
# Visitor signs up (unsuccesfully)
### Catalog page
# User clicks cart on product --> number adds on cart topnav
# Visitor clicks clicks cart on product --> redirected to sign up
# User or visitor filters by rating or money
# User or visitor organizes products by rating 5 - 1 (check that the first card has bigger number than last card)
# User or visitor organizes products by rating 1 - 5 (check that the first card has smaller number than last card)
### Product page
# Visitor clicks on write a review --> redirected to sign up
# User clicks on write a review --> writes unsuccesfully
# User clicks on write a review --> writes succesfully
### User profile page
# User changes icon
# User clicks on product heart --> goes to profile and can see it there
# User clicks on product heart again --> goes to profile and it is gone
# User buys something --> order is on profile
### Checkout
# User fills the first 2 steps on checkout form
# User completes checkout succesfully
# User completes checkout unsuccesfully (wrong card ? )