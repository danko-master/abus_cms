class CarsDomain < ActiveRecord::Base
  belongs_to :car
  belongs_to :domain
end
