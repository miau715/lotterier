class AddOrderIndexToPrize < ActiveRecord::Migration
  def change
    add_column :prizes, :order_index, :integer
  end
end
