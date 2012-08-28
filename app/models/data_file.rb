class DataFile < ActiveRecord::Base
    attr_accessor :upload, :car_id
    
  def self.save_file(upload)
   if  (upload !='')
    begin 
     file_name = upload.original_filename    
     file = upload.read    
    
     file_type = file_name.split('.').last
     
     # Вызов исключения, если файл некорректного типа
     raise ArgumentError if !TYPES_OF_IMAGES.index(file_type)
     
     new_name_file = Time.now.to_i
     name_folder = new_name_file
     new_file_name_with_type = "#{new_name_file}." + file_type
     
     #new_file_name_thumb_with_type = new_file_name_with_type
     new_file_name_thumb_with_type = "#{new_name_file}-thumb." + file_type
     
     image_root = "#{RAILS_CAR_IMAGES}"
     
     
     Dir.mkdir(image_root + "#{name_folder}");
       File.open(image_root + "#{name_folder}/" + new_file_name_with_type, "wb")  do |f|  
         f.write(file)
       end
     
     #Делаем уменьшенную копию
     image_thumb = MiniMagick::Image.read(file)
     image_thumb.resize "110x110"
     image_thumb.write image_root + "#{name_folder}/" + new_file_name_thumb_with_type 
    
      
      
      [new_name_file, new_file_name_with_type, new_file_name_thumb_with_type]
    
      rescue => ex
        puts "#{ex.class}: #{ex.message}"
      end  
    end   
  end
  
  def self.save_image_file(upload, car_id)
    name, image_file, image_thumb_file = save_file(upload)
    
   if name != nil && image_file != nil && image_thumb_file != nil
     new_image = Image.new(:name => name, 
      :image_file => image_file,
      :image_thumb_file => image_thumb_file,
      :car_id => car_id,
      :order_id => 0)     
     new_image.save
   else
     return false
   end
  end
  
end