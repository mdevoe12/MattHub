class DashboardController < ApplicationController

  def index
    response = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    starred = Faraday.get("https://api.github.com/users/#{current_user.nickname}/starred?access_token=#{current_user.token}")

    attrs = {
    "followers":  JSON.parse(response.body)['followers'],
    "following":  JSON.parse(response.body)['following'],
    "avatar_url": JSON.parse(response.body)['avatar_url'],
    "starred":    JSON.parse(starred.body).count
    }

    @user = Person.new(attrs)

  end
end
