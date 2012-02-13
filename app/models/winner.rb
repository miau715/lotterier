class Winner < ActiveRecord::Base
  belongs_to :event
  belongs_to :participant
  has_one :prize

  
end
