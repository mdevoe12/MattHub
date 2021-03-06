class GithubService

  attr_reader :current_user,
              :conn

  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :Token, @current_user.token
      faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.personal_attrs(current_user)
    new(current_user).find_info
  end

  def self.find_events(current_user)
    new(current_user).find_events
  end

  def self.find_following_events(current_user)
    new(current_user).find_following_events
  end

  def self.find_orgs(current_user)
    new(current_user).find_orgs
  end

  def self.find_repos(current_user)
    new(current_user).find_repos
  end

  def find_repos
    response = get_url("/users/#{current_user.nickname}/repos")
    repos = JSON.parse(response.body)
    names = repos.map { |repo| repo['name'] }
  end

  def find_orgs
    response = get_url("/users/#{current_user.nickname}/orgs")
    JSON.parse(response.body)
  end

  def find_following_events
    response = get_url("/users/#{@current_user.nickname}/received_events")
    JSON.parse(response.body)
  end

  def find_info
    base_info = get_url("/users/#{@current_user.nickname}")
    starred   = get_url("/users/#{@current_user.nickname}/starred")
    attrs = {
    "followers":  JSON.parse(base_info.body)['followers'],
    "following":  JSON.parse(base_info.body)['following'],
    "avatar_url": JSON.parse(base_info.body)['avatar_url'],
    "starred":    JSON.parse(starred.body).count
    }
  end

  def find_events
    response = get_url("/search/commits?q=author%3A#{@current_user.nickname}&sort=author-date")
    JSON.parse(response.body, symbolize_names: true)[:items]
  end

  private

  def get_url(url)
    @conn.get(url)
  end

end
