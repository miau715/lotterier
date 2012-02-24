class Prize < ActiveRecord::Base
  belongs_to :event
  has_many :participants
  
  validates :name, :presence => true
  validates :quantity, :presence => true
  
  scope :ordered, :order => "order_index ASC"
end
