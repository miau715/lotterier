class AddOtherColumnToParticipant < ActiveRecord::Migration
  def change
    add_column :participants, :phone_number, :string
    add_column :participants, :email, :string
    add_column :participants, :custom_id, :string
  end
end
