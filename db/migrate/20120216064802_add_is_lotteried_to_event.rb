class AddIsLotteriedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :is_lotteried, :boolean, :default => false
  end
end
