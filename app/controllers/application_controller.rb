class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_account
  
  def current_account
      @current_account ||= Account.find(session[:account_id]) if session[:account_id]
  end
  
  def require_account
      redirect_to '/login' unless current_account
  end
end
