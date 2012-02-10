class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.integer :event_id
      t.integer :prize_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
