class AddPrizeIdToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :prize_id, :integer
  end
end
