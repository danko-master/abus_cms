class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    if params[:alias] != nil
      @car = Car.find(:first, :conditions => ["alias = ?", params[:alias]])
    else
      @car = Car.find(params[:id])
    end
      #@images = @car.images.order("order_id")
  end
  
  
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params[:car])
    
    if @car.save
      flash[:success] = t('activerecord.errors.controllers.message.attributes.car.car_create_success')
       redirect_to cars_path
    else
      render 'new'
    end    
  end
  
  def update
    @car = Car.find(params[:id])
    
    if @car.update_attributes(params[:car])
      flash[:success] = t('activerecord.errors.controllers.message.attributes.car.car_update_success')
      redirect_to @car
    else
      redirect_to cars_path
    end
  end
  
  def destroy
    Car.find(params[:id]).destroy
    
    flash[:success] = t('activerecord.errors.controllers.message.attributes.car.car_destroy_success')
    redirect_to cars_path
  end
  

end
