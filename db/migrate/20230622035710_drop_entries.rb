class DropEntries < ActiveRecord::Migration[6.0]
  def change
    drop_table :entries if table_exists?(:entries)
  end
end
