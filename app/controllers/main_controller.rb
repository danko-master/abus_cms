class MainController < ApplicationController

  def show
    @main = Main.where({:domain => session[:current_domain_id]}).first
    session[:return_to] = request.referer
  end
  
  def update
    @main = Main.where({:domain => session[:current_domain_id]}).first
    
    if @main.update_attributes(params[:main])
      flash[:success] = t('activerecord.errors.controllers.message.attributes.page.page_update_success')
      redirect_to session[:return_to]      
    else
      render 'show'
    end
    session[:return_to] = nil
  end
  
end
