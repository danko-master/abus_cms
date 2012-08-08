
require 'spec_helper'

describe Main do
    before(:each) do
    @attr = {:domain => 1}     
  end
  
  it "Create a new instance given valid attributes" do
    Main.create!(@attr)
  end
  
  it "Require Main domain" do
    no_domain_page = Page.new(@attr.merge(:domain => ""))
    no_domain_page.should_not be_valid
  end
  
  
  
  
end