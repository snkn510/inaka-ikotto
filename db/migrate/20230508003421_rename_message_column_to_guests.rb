class RenameMessageColumnToGuests < ActiveRecord::Migration[6.0]
  def change
    rename_column :guests, :message, :date
  end
end
