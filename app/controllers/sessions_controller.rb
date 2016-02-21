class SessionsController < ApplicationController
  skip_before_action :require_user

  def new
    redirect_to current_user if current_user
  end

  def create
    user = User.find_or_create(user_params)
    session[:user_id] = user.id
    redirect_to user
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_params
    info = auth_hash.info
    credentials = auth_hash.credentials
    {
      email: info.email,
      name: info.name,
      uid: auth_hash.uid,
      token: credentials.token,
      refresh_token: credentials.refresh_token
    }
  end
end
