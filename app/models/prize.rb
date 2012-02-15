class Prize < ActiveRecord::Base
  belongs_to :event
  
  has_many :prize_winners
  has_many :winners, :through => :prize_winners, :class_name => "Participant"
  
  
end
