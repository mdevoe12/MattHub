class Repository

  attr_reader :names

  def initialize(names)
    @names = names
  end

  def self.create_repos(current_user)
    Repository.new(GithubService.find_repos(current_user))
  end

end
