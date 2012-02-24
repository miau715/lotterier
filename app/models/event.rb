class Event < ActiveRecord::Base
  belongs_to :user
  has_many :participants, :dependent => :destroy
  has_many :prizes
  
  validates :name, :presence => true
  validates :description, :presence => true
  
end
