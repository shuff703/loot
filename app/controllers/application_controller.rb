class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_username
  
  def current_username
      @current_username ||= Account.find(session[:account_id]) if session[:account_id]
  end
  
  def require_username
      redirect_to '/login' unless current_username
  end
end
