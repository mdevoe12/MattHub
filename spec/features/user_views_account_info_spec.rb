require 'rails_helper'

feature "user sees account info" do
  scenario "from dashboard" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("features/user_views_account_info_spec.rb") do
      visit dashboard_index_path

      expect(page).to have_content("#{user.nickname}")
      expect(page).to have_content("Followers: 5")
      expect(page).to have_content("Following: 2")
      expect(page).to have_content("Starred Repos: 3")
    end
  end
end
