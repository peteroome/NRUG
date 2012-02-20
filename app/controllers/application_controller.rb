class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Helper Methods
  #
  helper_method :current_user, :require_user
  
  # Filters
  #
  before_filter :current_user, :store_location
  
  private
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You need to log in!"
      redirect_to login_url
      return false
    end
  end
  
  def current_user
    # Set to Pete by default whilst on train with no signal
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def store_location
    session[:return_to] = request.referer
  end
end