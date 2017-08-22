class Person

  attr_reader :avatar_url,
              :followers,
              :following

  def initialize(attributes = {})
    @avatar_url = attributes[:avatar_url]
    @followers = attributes[:followers].to_i
    @following = attributes[:following].to_i
  end


end
