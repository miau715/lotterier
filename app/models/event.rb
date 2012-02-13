class Event < ActiveRecord::Base
  belongs_to :user
  has_many :participants
  has_many :prizes
  has_many :winners
  

  
end
