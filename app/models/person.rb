class Person

  attr_reader :avatar_url,
              :followers,
              :following,
              :starred

  def initialize(attributes = {})
    @avatar_url = attributes[:avatar_url]
    @followers = attributes[:followers].to_i
    @following = attributes[:following].to_i
    @starred = attributes[:starred].to_i
  end

  def self.display_person(current_user)
    Person.new(GithubService.personal_attrs(current_user))
  end

end
