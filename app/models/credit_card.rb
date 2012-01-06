class CreditCard < ActiveRecord::Base
  attr_accessible :card_number, :card_type, :expdate_month, :expdate_year, :cvv_number
  
  belongs_to :user
  
  validates :card_number, :presence => true, :length => { :maximum => 16 }
  validates :card_type, :presence => true
  validates :expdate_month, :presence => true
  validates :expdate_year, :presence => true
  validates :cvv_number, :presence => true
  validates :user_id, :presence => true
end
