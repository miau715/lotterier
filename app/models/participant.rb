class Participant < ActiveRecord::Base
  belongs_to :event
  has_many :winners
end
