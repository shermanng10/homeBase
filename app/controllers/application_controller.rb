class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
	helper_method :current_user, :log_in, :logged_in?

  def current_user
    @current_user ||= Family.find_by(id: session[:user_id])
  end

  def log_in family
    session[:user_id] = family.id
  end

  def logged_in?
    !!current_user
  end
end
