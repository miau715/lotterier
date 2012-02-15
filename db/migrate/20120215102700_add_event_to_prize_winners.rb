class AddEventToPrizeWinners < ActiveRecord::Migration
  def change
    add_column :prize_winners, :event_id, :integer 
  end
end
