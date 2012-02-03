class AddEventIdToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :event_id, :integer
  end
end
