require 'spec_helper'

describe DataFile do
  describe "Should save image file" do 
      
    let(:file) do
      fixture_file_upload('/files/test-bus-1.jpg', 'image/jpg')
    end
  
    it "Creating new car name and thumb name" do
      get_array = DataFile.save_file(file)
      FileUtils.rm_rf("#{RAILS_CAR_IMAGES}" + "#{get_array[0]}")
      get_array.should_not be_nil
    end
  
  end
end