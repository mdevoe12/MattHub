class GithubService

  attr_reader :@current_user,
              :@conn,
              :@events_conn

  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :Token, @current_user.token
      faraday.adapter Faraday.default_adapter
    end
    @events_conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.authorization :Token, @current_user.token
      faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.personal_attrs(current_user)
    new(current_user).find_info
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

  def get_url(url)
    @conn.get(url)
  end

  def self.find_events(user)
    new(user).find_events
  end

  def find_events
    get_events_url("/search/commits?q=author%3A#{@current_user.nickname}&sort=author-date&per_page=800")
  end

  def get_events_url(url)
    response = @events_conn.get(url)
    results = JSON.parse(response.body, symbolize_names: true)
    new_results = []
    results[:items].each {|thing| new_results << {thing[:commit][:author][:date] => thing[:repository][:name]}}
    new_results
    byebug
  end

end
