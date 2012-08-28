require 'spec_helper'

describe Car do
  before(:each) do
    @attr = {:name => "My Car", :alias => "test-car1", :is_show => true}
  end
  
  it "Creating a car with valid data" do
    Car.create!(@attr)
  end
  
  it "Creating a car with valid and unique data" do
    Car.create!(@attr)
    
    @duplicate_car = Car.new(@attr)
    @duplicate_car.should_not be_valid
  end
  
  it "Should be ok with an associated images" do
    @car = Car.new
    
    @car.images.build
    @car.should have(:no).errors_on(:images)
  end
  
  it "Require Car name" do
    no_name_car = Car.new(@attr.merge(:name => ""))
    no_name_car.should_not be_valid
  end
  
  it "Require Car not nil name" do
    no_name_car = Car.new(@attr.merge(:name => nil))
    no_name_car.should_not be_valid
  end
  
  it "Require Car is_show" do
    no_show_car = Car.new(@attr.merge(:is_show => ""))
    no_show_car.should_not be_valid
  end
  
  it "Require Car not nil is_show" do
    no_show_car = Car.new(@attr.merge(:is_show => nil))
    no_show_car.should_not be_valid
  end

  
end
