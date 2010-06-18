# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'application'
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected

  def login_required
      if session[:user_id]
        return true
      end
      flash[:warning]='Please login to continue'
      session[:return_to]=request.request_uri
      redirect_to :controller => "account", :action => "login"
      return false 
  end
    
  def current_user
    @current_user ||= UserProfile.find_by_id(session[:user_id])
  end
  
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end


end
