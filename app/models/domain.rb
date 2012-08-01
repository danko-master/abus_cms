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
  attr_accessible :name
  
  domain_regex = /^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z0-9\-]{2,8}$/i
  
  validates :name,
                :presence => true,
                :format => {:with => domain_regex},
                :uniqueness => { :case_sensitive => false }
  
end
