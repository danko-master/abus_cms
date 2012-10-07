class CarsController < ApplicationController
  def index
    if params[:domain_id]
      @domain = Domain.find(params[:domain_id])
      @cars_domain = @domain.cars.order("order_id")
      @cars = Car.order('updated_at DESC').find(:all, :conditions => ['id not in(select car_id from cars_domains where domain_id = ?)', params[:domain_id]])
    else
       @cars = Car.order('updated_at DESC').all
    end   
    
    @domains = Domain.all
  end

  def show
    if params[:alias] != nil
      @car = Car.find(:first, :conditions => ["alias = ?", params[:alias]])
    else
      @car = Car.find(params[:id])
    end
      @image = @car.images.order("order_id").first
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
    car = Car.find(params[:id])
    car_images = car.images
    
    Car.delete_car_full(car, car_images)
    #Car.find(params[:id]).destroy
    
    flash[:success] = t('activerecord.errors.controllers.message.attributes.car.car_destroy_success')
    redirect_to cars_path
  end
  
  def update_domain
    cardomain = CarsDomain.new(:car_id => params[:car_id], :domain_id => params[:domain_id])
    cardomain.save
    
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def destroy_domain
    CarsDomain.where(:car_id => params[:car_id], :domain_id => params[:domain_id]).destroy_all

    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def sort
    params[:car].each_with_index do |id, index|
      CarsDomain.where(:domain_id => params[:domain_id]).update_all({order_id: index+1}, {car_id: id})
    end  
  end

end
