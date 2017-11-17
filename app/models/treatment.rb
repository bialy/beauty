class Treatment < ActiveRecord::Base
  belongs_to :offer
  attr_accessible :content
  
  validates_presence_of :content 
end
