class GithubService

  def self.personal_attrs(current_user)
    base_info = Faraday.get("https://api.github.com/user?access_token=#{current_user.token}")
    starred  = Faraday.get("https://api.github.com/users/#{current_user.nickname}/starred?access_token=#{current_user.token}")

    attrs = {
    "followers":  JSON.parse(base_info.body)['followers'],
    "following":  JSON.parse(base_info.body)['following'],
    "avatar_url": JSON.parse(base_info.body)['avatar_url'],
    "starred":    JSON.parse(starred.body).count
    }
  end

end
