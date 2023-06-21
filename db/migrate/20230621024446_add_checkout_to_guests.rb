class AddCheckoutToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :checkout, :date
  end
end
