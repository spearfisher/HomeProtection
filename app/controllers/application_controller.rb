class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  protect_from_forgery with: :exception
  before_action :require_user

  private

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_user
    redirect_to root_path unless current_user
  end
end
