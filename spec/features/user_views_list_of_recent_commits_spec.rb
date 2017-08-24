require 'rails_helper'

feature 'user sees' do
  scenario 'list of commits' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("features/user_views_list_of_recent_commits_spec.rb") do
      visit commit_index_path

      expect(page).to have_content("#{user.nickname}'s Recent Commits")
      expect(page).to have_content("MattHub")
      expect(page).to have_content("2017-08-21")
      expect(page).to have_content("rales_engine")
      expect(page).to have_content("2017-08-18")
    end
  end
end
