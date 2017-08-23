class Repository

  attr_reader :names

  def initialize(names)
    @names = names
  end

  def self.create_repos(repos)
    names = repos.map { |repo| repo['name'] }
    Repository.new(names)
  end

end
