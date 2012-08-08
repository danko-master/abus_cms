class ApplicationController < ActionController::Base
  
  before_filter :require_login
  
  protect_from_forgery
  
  #for sessions
  include SessionsHelper
  


private

  def require_login
    unless current_user
      redirect_to signin_path
    end
  end
  
end
