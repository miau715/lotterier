class AddPrizeQuantityToEvent < ActiveRecord::Migration
  def change
    add_column :events, :prize_quantity, :integer, :default => 0
  end
end
