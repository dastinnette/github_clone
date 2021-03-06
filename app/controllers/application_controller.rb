class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :github_service

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def github_service
    @github_service ||= GithubService.new(current_user) if current_user
  end
end
