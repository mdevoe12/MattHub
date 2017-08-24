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

  # def followers_count
  #   # @followers ||= service.followers.map do |raw_follower|
  #   #   Person.new(raw_follower)
  #   # end
  #
  #   base_info[:followers]
  # end
  #
  # private
  #   def base_info
  #     @base_info ||= service.base_info
  #   end
  #
  #   def service
  #     @service ||= GithubService
  #   end

end
