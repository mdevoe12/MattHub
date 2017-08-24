FactoryGirl.define do
  factory :user do
    nickname "mdevoe12"
    email "matthew.devoe@gmail.com"
    provider "github"
    token "98e98659f31571e5d57424556c8bda609e1e564f"
    uid "23343135"
    image_url "https://avatars0.githubusercontent.com/u/23343135?v=4"
  end
end
