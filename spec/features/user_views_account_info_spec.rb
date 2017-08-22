require 'rails_helper'

feature "user sees account info" do
  scenario "from dashboard" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Login")

    click_link "Login"
    visit dashboard_index_path

    expect(page).to have_content("#{user.nickname}")
    expect(page).to have_content("Followers: 0")
    expect(page).to have_content("Following: 1")
    expect(page).to have_content("Starred Repos: 3")
  end
end
