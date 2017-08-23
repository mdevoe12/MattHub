require 'rails_helper'

feature 'user sees' do
  scenario 'list of repos' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    VCR.use_cassette("features/user_views_list_of_repos.rb") do
      visit repo_index_path

      expect(page).to have_content("authentication-authorization-example")
      expect(page).to have_content("battleship")
      expect(page).to have_content("black_thursday")
      expect(page).to have_content("project-tracker")
    end
  end
end
