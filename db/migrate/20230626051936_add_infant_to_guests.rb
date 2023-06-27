class AddInfantToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :infant, :integer
  end
end
