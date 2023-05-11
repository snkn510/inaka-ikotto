class AddColumnsToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :adult, :integer, null: false
    add_column :guests, :child, :integer, null: false
  end
end
