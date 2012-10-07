class ImagesController < ApplicationController
  def index
      @car = Car.find(params[:car_id])
      @images = @car.images.order("order_id")
  end

  def create
  end
  
  def update    
  end
  
  def upload_image 
    uploaded_io = params[:upload][:image]
    uploaded_io.original_filename = Time.now.to_i.to_s + "." + uploaded_io.original_filename.split('.').last
    
    current_order = Image.where("car_id = ?",params[:car_id]).count(:all)
    
    new_img = Image.new(:car_id => params[:car_id], :image => uploaded_io, :order_id => (current_order.to_i + 1))
    #new_img = new_img(:image_file_name => Time.now.to_i)
    if params[:upload].present? && params[:car_id].present?
      if new_img.save #Image.save_image_file(params[:upload][:image], params[:car_id])
        flash[:success] = t('activerecord.errors.controllers.message.attributes.image.image_create_success')
      else
        flash[:error] = t('activerecord.errors.controllers.message.attributes.image.image_error')
      end
    end
    redirect_to images_path(:car_id => params[:car_id])
  end

  def destroy
    
    current_image = Image.find(params[:id])
    current_car = current_image.car
  
    Image.find(params[:id]).destroy  
    flash[:notice] = t('activerecord.errors.controllers.message.attributes.image.image_destroy_success')
    
    @images = current_car.images.order("order_id")
    
    respond_to do |format|
      format.html { redirect_to images_path(:car_id => params[:id]) }
      format.js
    end
    
  end
  
  def sort
    params[:image].each_with_index do |id, index|
      Image.update_all({order_id: index+1}, {id: id})
    end  
  end
  

end
