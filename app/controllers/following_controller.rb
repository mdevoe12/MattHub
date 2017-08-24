class FollowingController < ApplicationController

  def index
    @followings = Following.display_activity(current_user)
  end

end
