# == Schema Information
#
# Table name: domains
#
#  id         :integer         not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Domain do
    before(:each) do
    @attr = {:name => "mydomainexample.com"}
      
    @attr2 = {:name => "mydomainexample.com"}
  end
  
  it "Create a new instance given valid attributes" do
    Domain.create!(@attr)
  end
  
  it "Require Domain name" do
    no_name_domain = Domain.new(@attr.merge(:name => ""))
    no_name_domain.should_not be_valid
  end
  
  it "Require Domain not nil name" do
    no_name_domain = Domain.new(@attr.merge(:name => nil))
    no_name_domain.should_not be_valid
  end
  
  it "Accept valid domain name" do
    
    domains = %w[foo.com USER.org abC.ru]
    domains.each do |domain|
      valid_domain = Domain.new(@attr.merge(:name => domain))
      valid_domain.should be_valid
    end
  end
  
  it "Accept valid domain name with regex" do
    @domain = FactoryGirl.create(:domain)
    @domain[:name].should =~ /^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z0-9\-]{2,8}$/i
  end
  
  
  
  it "Reject invalid domain addresses" do    
    domains = %w[user,com user_.org foo. hgzce1ai3aes!3a.xn--p1ai]
    domains.each do |domain|
      invalid_domain = Domain.new(@attr.merge(:name => domain))
      invalid_domain.should_not be_valid
    end    
  end
  
  it "Reject duplicate domain" do
    Domain.create!(@attr)
    user_with_duplicate_domain = User.new(@attr.merge(:name => @attr2[:name]))
    user_with_duplicate_domain.should_not be_valid
  end
  
  
end
