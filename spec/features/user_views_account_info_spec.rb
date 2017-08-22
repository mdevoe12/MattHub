require 'rails_helper'

feature "user sees account info" do
  scenario "from dashboard" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    expect(page).to have_content("#{user.nickname}")
    expect(page).to have_content("Starred Repos: 3")
    expect(page).to have_content("Followers: 0")
    expect(page).to have_content("Following: 1")
  end
end
