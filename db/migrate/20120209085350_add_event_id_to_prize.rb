class AddEventIdToPrize < ActiveRecord::Migration
  def change
    add_column :prizes, :event_id, :integer
  end
end
