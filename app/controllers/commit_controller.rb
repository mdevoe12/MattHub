class CommitController < ApplicationController

  def index
    @commits = Commit.for_user(current_user)
  end

end
