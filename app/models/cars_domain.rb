class CarsDomain < ActiveRecord::Base
  belongs_to :car
  belongs_to :domain
  
  attr_accessible :car_id, :domain_id
end
