class Prize < ActiveRecord::Base
  belongs_to :event
  has_many :participants
  
  scope :ordered, :order => "order_index ASC"
end
