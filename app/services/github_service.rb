class GithubService


   def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :Token, @current_user.token
      faraday.adapter Faraday.default_adapter
    end
   end

  def self.personal_attrs(current_user)
    new(current_user).find_body_info
  end

  def find_body_info
    base_info = @conn.get("/users/#{@current_user.nickname}")
    starred   = @conn.get("/users/#{@current_user.nickname}/starred")
    attrs = {
    "followers":  JSON.parse(base_info.body)['followers'],
    "following":  JSON.parse(base_info.body)['following'],
    "avatar_url": JSON.parse(base_info.body)['avatar_url'],
    "starred":    JSON.parse(starred.body).count
    }
  end

  def get_url(url)
    @conn.get(url)
  end

end
