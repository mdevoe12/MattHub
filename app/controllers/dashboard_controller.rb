class DashboardController < ApplicationController

  def index
    @person = Person.display_person(current_user)
  end

end
