class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end

  def destroy
    byebug
  end
end
