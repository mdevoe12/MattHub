class Commit

  attr_reader :commits

  def initialize(commits)
    @commits = commits
  end

  def self.display_commits(current_user)
    Commit.new(GithubService.find_events(current_user))
  end

end
