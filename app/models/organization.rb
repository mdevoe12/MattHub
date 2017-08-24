class Organization

  attr_reader :orgs

  def initialize(orgs)
    @orgs = orgs
  end

  def self.display_orgs(current_user)
    Organization.new(GithubService.find_orgs(current_user))
  end

end
