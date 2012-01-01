class Mobile < ActiveRecord::Base
  attr_accessible :mobile_number
  
  belongs_to :user
  
  validates :mobile_number, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
end
