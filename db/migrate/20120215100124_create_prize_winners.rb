class CreatePrizeWinners < ActiveRecord::Migration
  def change
    create_table :prize_winners do |t|
      t.integer :prize_id
      t.integer :participant_id
      t.timestamps
    end
  end
end
