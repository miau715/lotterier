class Event < ActiveRecord::Base
  belongs_to :user
  has_many :participants, :dependent => :destroy
  has_many :prizes
  has_attached_file :excerpt_image, :styles => { :large => "600x600"}
  
  validates :name, :presence => true
  validates :description, :presence => true
  
end
