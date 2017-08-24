require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Login")
    VCR.use_cassette("features/user_logs_in_with_github_spec.rb") do
      click_link "Login"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Hello")
      expect(page).to have_content("Matt")
    end
  end
end
