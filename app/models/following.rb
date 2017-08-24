class Following

  attr_reader :events

  def initialize(events)
    @events = events
  end

  def self.display_activity(current_user)
    Following.new(GithubService.find_following_events(current_user))
  end

end
