class DropMessages < ActiveRecord::Migration[6.0]
  def change
    drop_table :messages if table_exists?(:messages)
  end
end
