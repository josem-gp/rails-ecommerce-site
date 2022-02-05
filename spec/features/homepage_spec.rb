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

### User profile page
# User changes icon
# User clicks on product heart --> goes to profile and can see it there
# User clicks on product heart again --> goes to profile and it is gone
# User buys something --> order is on profile (we can fake this with FactoryBot)

### Checkout [Don't do because there are many changes still to be done]
# User fills the first 2 steps on checkout form
# User completes checkout succesfully
# User completes checkout unsuccesfully (wrong card ? )