class Participant < ActiveRecord::Base
  belongs_to :event, :counter_cache => true
  belongs_to :prize
end
