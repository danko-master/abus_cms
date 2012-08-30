# == Schema Information
#
# Table name: domains
#
#  id         :integer         not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class Domain < ActiveRecord::Base
  
    has_many :cars_domains
    has_many :cars, :through => :cars_domains
    
  attr_accessible :name
  
  domain_regex = /^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z0-9\-]{2,8}$/i
  
  validates :name,
                :presence => true,
                :format => {:with => domain_regex},
                :uniqueness => { :case_sensitive => false }
                

  
end
