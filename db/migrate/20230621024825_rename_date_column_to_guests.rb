class RenameDateColumnToGuests < ActiveRecord::Migration[6.0]
  def change
    rename_column :guests, :date, :checkin
  end
end
