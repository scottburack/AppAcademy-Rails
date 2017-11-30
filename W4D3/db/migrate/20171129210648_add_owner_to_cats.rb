class AddOwnerToCats < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :owner_id, :integer, null: false
    add_index :cats, :owner_id
  end
end
