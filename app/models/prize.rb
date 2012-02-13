class Prize < ActiveRecord::Base
  belongs_to :event
  belongs_to :winner
end
