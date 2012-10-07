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
  
    has_many :cars_domains, :dependent => :delete_all
    has_many :cars, :through => :cars_domains
    
  attr_accessible :name, :title
  
  domain_regex = /^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z0-9\-]{2,8}$/i
  
  validates :name,
                :presence => true,
                :format => {:with => domain_regex},
                :uniqueness => { :case_sensitive => false }
                
  def self.save_with_main(domain_name)
    domain = Domain.find(:first, :conditions => ["name = ?", domain_name])
    main = Main.new(:title => domain_name, :domain => domain.id)
    main.save
  end
  
end
