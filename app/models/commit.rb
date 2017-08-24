class Commit

  attr_reader :date,
              :repo_name

  def initialize(event = {})
    @date = event[:commit][:author][:date]
    @repo_name = event[:repository][:name]
  end

  def self.for_user(user)
    GithubService.find_events(user).map do |raw_event|
      Commit.new(raw_event)
    end
  end

end
