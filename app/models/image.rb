class Image < ActiveRecord::Base
  belongs_to :car,
   :foreign_key => "car_id"
      
  has_attached_file :image, :styles => { :medium => "320x320>", :small => "110x110>" }
  
  validates_attachment_size :image, :less_than => 20.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 
                                                              'image/png', 
                                                              'image/jpg']
  
   #attr_accessor :data_file_name
  attr_accessible :image, :car_id, :order_id 
    
   # def self.save_image_file(data_file, car_id)
      
   # end
    
   # def self.delete_image_file(image_id)      
   #   current_image = Image.find(image_id)      
   #   current_image.destroy if FileUtils.rm_rf("#{RAILS_CAR_IMAGES}" + "#{current_image.name}")
   # end
    
end
