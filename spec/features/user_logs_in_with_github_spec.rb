require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Login")

    click_link "Login"

    expect(page).to have_content("Hello")
    expect(page).to have_content("Matt")
  end
end
