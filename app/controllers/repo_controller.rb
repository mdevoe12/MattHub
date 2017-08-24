class RepoController < ApplicationController

  def index
    
    @repos = Repository.create_repos(current_user)
  end

end
