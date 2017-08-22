FactoryGirl.define do
  factory :user do
    nickname "Shiva the Destroyer"
    email "Shiva@aol.com"
    provider "github"
    token "123456abcd"
    uid "shiva12"
    image_url "MyString"
  end
end
