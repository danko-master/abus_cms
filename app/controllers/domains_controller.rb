class DomainsController < ApplicationController
 

  def index
    @domains = Domain.all
  end
  
  def show
    @domain = Domain.find(params[:id])
    
    session[:current_domain_id] = @domain.id
    session[:current_domain_name] = @domain.name
  end

  def new
    @domain = Domain.new
  end
  
  def create
    @domain = Domain.new(params[:domain])
    
    if @domain.save
      flash[:success] = t('activerecord.errors.controllers.message.attributes.domain.domain_create_success')
       redirect_to domains_path
    else
      render 'new'
    end    
  end
  
  def update
    @domain = Domain.find(params[:id])
    
    if @domain.update_attributes(params[:domain])
      flash[:success] = t('activerecord.errors.controllers.message.attributes.domain.domain_update_success')
      redirect_to @domain
    else
      redirect_to domains_path
    end
  end
  
  def destroy
    Domain.find(params[:id]).destroy
    
    flash[:success] = t('activerecord.errors.controllers.message.attributes.domain.domain_destroy_success')
    redirect_to domains_path
  end
  
  
end
