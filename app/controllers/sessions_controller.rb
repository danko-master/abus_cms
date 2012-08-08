class SessionsController < ApplicationController
  
  skip_before_filter :require_login
    
  def new
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = t('activerecord.errors.controllers.message.attributes.auth.auth_error')
      render 'new'
    else
      sign_in user
      flash.now[:success] = t('activerecord.errors.controllers.message.attributes.auth.auth_success')
      #render 'success'
      redirect_back_or user
    end
  end
  
  def destroy
    sign_out
    session[:current_domain_id] = nil
    session[:current_domain_name] = nil
    redirect_to root_path
  end
  
  def success
  end

end
