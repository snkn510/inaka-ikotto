class AddMessageToGuests < ActiveRecord::Migration[6.0]
  def change
    add_column :guests, :message, :text
  end
end
