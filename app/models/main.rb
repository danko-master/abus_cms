# == Schema Information
#
# Table name: mains
#
#  id              :integer         not null, primary key
#  title           :text
#  content         :text
#  metadescription :text
#  metakeywords    :text
#  head            :text
#  contact         :text
#  footer          :text
#  counter         :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Main < ActiveRecord::Base
  
    attr_accessible :title, :content, :metadescription, :metakeywords, :head, :contact, :footer, :counter, :domain
    
      validates :domain,
                :presence => true
end
