require 'spec_helper'

describe Car do
  before(:each) do
    @attr = {:name => "My Car", :is_show => true}
  end
  
  it "Create a new Car given valid attributes" do
    Car.create!(@attr)
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
