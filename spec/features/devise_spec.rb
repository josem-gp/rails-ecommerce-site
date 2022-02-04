require 'rails_helper'

RSpec.feature "Devise interactions", type: :feature do
    let(:user) { FactoryBot.create(:non_admin_user) }

    scenario "user logs in sucessfully" do
        visit new_user_session_path

        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"

        expect(page).to have_current_path "/"
    end

    scenario "user logs in unsuccesfully" do
        visit new_user_session_path

        fill_in "Password", with: user.password
        click_button "Log in"

        expect(page).to have_text('Invalid Email or password')
    end

    scenario "visitor signs up succesfully", js:true do
        visit new_user_registration_path

        fill_in "Username", with: "josem"
        fill_in "Email", with: "abcd@test.com"
        within ".user_password" do
            fill_in 'Password', with: 'testing'
        end
        within ".user_password_confirmation" do
            fill_in 'Password confirmation', with: 'testing'
        end

        click_button "Sign up"

        # expect(page).to have_text('Welcome! You have signed up successfully.')
    end

    scenario "visitor signs up unsuccesfully" do
        visit new_user_registration_path

        fill_in "Username", with: "josem"
        fill_in "Email", with: "abcd"
        within ".user_password" do
            fill_in 'Password', with: 'password'
        end
        within ".user_password_confirmation" do
            fill_in 'Password confirmation', with: 'password'
        end
        click_button "Sign up"

        expect(page).to have_text('Email is invalid')
    end
end