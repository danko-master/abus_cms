class PagesController < ApplicationController
  def new
    @page = Page.new
  end

  def index
    if session[:current_domain_id]
      @pages = Page.where({:domain => session[:current_domain_id]})
    end    
  end
  
  def show
    @page = Page.find(params[:id])
  end

  def create  
   @page = Page.new(params[:page].merge(:domain => session[:current_domain_id]))
   
    if @page.save
      flash[:success] = t('activerecord.errors.controllers.message.attributes.page.page_create_success')
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:success] = t('activerecord.errors.controllers.message.attributes.page.page_update_success')
      redirect_to @page
    else
      render 'show'
    end  
  end

  def destroy
    Page.find(params[:id]).destroy

    flash[:success] = t('activerecord.errors.controllers.message.attributes.page.page_destroy_success')
    redirect_to pages_path
  end
end
