require 'spec_helper'

describe Image do
    before :each do
      @attr = {:name => "image-1", :image_file => "image-1.png", :image_thumb_file => "image-1-thumb.png", :car_id => 1, :order_id => 0}
    end
    
  it "Accept valid domain name" do
      valid_image = Image.new(@attr)
      valid_image.should be_valid
  end
    
end
