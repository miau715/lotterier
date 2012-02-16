class Prize < ActiveRecord::Base
  belongs_to :event
  has_many :participants
end
