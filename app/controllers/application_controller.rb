class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  protect_from_forgery with: :exception
  before_action :require_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_user
    redirect_to root_path unless current_user
  end
end
