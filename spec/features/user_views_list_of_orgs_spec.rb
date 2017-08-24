require 'rails_helper'

feature 'user sees' do
  scenario 'list of the organizations they belong to' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("features/user_views_list_of_orgs_spec.rb") do
      visit orgs_path

      expect(page).to have_content("#{user.nickname}'s Organizations")

    end
  end
end
