class AddIsImportedToEvent < ActiveRecord::Migration
  def change
    add_column :events, :is_imported, :boolean, :default => false
  end
end
