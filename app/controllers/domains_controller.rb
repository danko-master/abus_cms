class DomainsController < ApplicationController
  
  
  def index
    @domain = Domain.all
  end
  
  def show
    @domain = Domain.find(params[:id])
  end

  def new
    @domain = Domain.new
  end
  
  def create
      
  end
  
  
end
