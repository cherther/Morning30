class AccountController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:openid]
  before_filter :login_required, :only=>['logout']
  
  def login
  end
  
  def openid
    if data = RPXNow.user_data(params[:token])
      data = {:user_name => data[:username], :email => data[:email], :identifier => data[:identifier]}
      self.current_user = UserProfile.find_by_identifier(data[:identifier]) || UserProfile.create!(data)
      redirect_to session[:return_to] || '/workouts'
    else
      flash[:error] = :default
      redirect_to :action => :login
    end
  end
  
  def logout
    self.current_user = nil
    reset_session
    redirect_to :action => :login
  end

  def register
  end

end
