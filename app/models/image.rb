class Image < ActiveRecord::Base
  belongs_to :car,
   :foreign_key => "car_id"
  
    attr_accessible :name, :image_file, :image_thumb_file, :car_id, :order_id
    
    def self.delete_image_file(image_id)      
      current_image = Image.find(image_id)      
      current_image.destroy if FileUtils.rm_rf("#{RAILS_CAR_IMAGES}" + "#{current_image.name}")
    end
    
end
