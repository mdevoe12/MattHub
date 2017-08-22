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

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "12345678",
      info: {
        email: "matthew.devoe@gmail.com",
        name: "Matt",
        nickname: "Matt",
      },
      credentials: {
        token: "12345abcdefghijklmnop"
      }
      })
  end
end
