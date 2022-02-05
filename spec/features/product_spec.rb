require 'rails_helper'

RSpec.feature "Catalog interactions", type: :feature do

    let(:user) { FactoryBot.create(:non_admin_user) }

    let(:product) { FactoryBot.create(:correct_product) }

    scenario "visitor clicks on write a review" do

    end

    scenario "user writes review successfully" do

    end

    scenario "user writes review unsuccessfully" do

    end
end