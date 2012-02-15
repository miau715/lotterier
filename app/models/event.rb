class Event < ActiveRecord::Base
  belongs_to :user
  has_many :participants
  has_many :prizes

  has_many :prize_winners
  has_many :winners, :through => :prize_winners, :class_name => "Participant", :foreign_key => "participant_id"

  
end
