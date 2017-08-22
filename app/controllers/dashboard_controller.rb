class DashboardController < ApplicationController

  def index

    response = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")

    user = JSON.parse(response.body, sumbolize_names: true)

    @user = user.map do |attribs|
      Person.new(attribs)
    end
  end
end
