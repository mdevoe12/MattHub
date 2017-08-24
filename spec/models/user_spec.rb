require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      "provider" => "github",
      "uid" => "12345678",
      "info" => {
        "email" => "matthew.devoe@gmail.com",
        "name" => "Matt",
        "nickname" => "Matt",
      },
      "credentials" => {
        "token" => "12345abcdefghijklmnop"
      }
    }
  
    User.find_or_create_from_auth(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("12345678")
    expect(new_user.email).to eq("matthew.devoe@gmail.com")
    expect(new_user.nickname).to eq("Matt")
    expect(new_user.token).to eq("12345abcdefghijklmnop")
  end
end
