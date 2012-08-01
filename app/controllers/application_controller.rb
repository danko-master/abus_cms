class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #for sessions
  include SessionsHelper
  
end
