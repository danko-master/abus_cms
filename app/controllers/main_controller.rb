class MainController < ApplicationController

  def show
    @main = Main.where({:domain => session[:current_domain_id]}).first
  end
  
  def update
    @main = Main.where({:domain => session[:current_domain_id]}).first
    
    if @main.update_attributes(params[:main])
      flash[:success] = t('activerecord.errors.controllers.message.attributes.page.page_update_success')
      redirect_to root_path
    else
      render 'show'
    end
  end


end
