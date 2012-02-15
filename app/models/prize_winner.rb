class PrizeWinner < ActiveRecord::Base
  belongs_to :prize
  belongs_to :event
  belongs_to :winner , :class_name => "Participant", :foreign_key => "participant_id"

  before_create :insert_event_id
  
  def insert_event_id
    event_id = prize.event_id
  end
end
