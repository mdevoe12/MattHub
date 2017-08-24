class CommitController < ApplicationController

  def index
    @commits = Commit.display_commits(current_user)
  end

end
