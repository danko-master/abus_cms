
require 'spec_helper'

describe Page do
    before(:each) do
    @attr = {:name => "mypageexample1",
      :domain => 1}     
  end
  
  it "Create a new instance given valid attributes" do
    Page.create!(@attr)
  end
  
  it "Require Page name" do
    no_name_page = Page.new(@attr.merge(:name => ""))
    no_name_page.should_not be_valid
  end
  
  it "Require Page domain" do
    no_domain_page = Page.new(@attr.merge(:domain => ""))
    no_domain_page.should_not be_valid
  end
  
  it "Accept valid page name" do
    
    pages = %w[foo USER abC]
    pages.each do |page|
      valid_page = Page.new(@attr.merge(:name => page))
      valid_page.should be_valid
    end
  end
  
  
  
end