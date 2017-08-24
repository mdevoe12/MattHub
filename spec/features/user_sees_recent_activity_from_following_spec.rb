require 'rails_helper'

feature 'user sees' do
  scenario 'list of recent activity' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("features/user_sees_recent_activity_from_following_spec.rb") do
      visit  following_index_path

      expect(page).to have_content("People you follow's recent activity")
    end
  end
end
