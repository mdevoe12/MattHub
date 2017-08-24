class OrgsController < ApplicationController


  def index
    @orgs = Organization.display_orgs(current_user)
  end
end
