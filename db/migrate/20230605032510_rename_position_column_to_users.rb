class RenamePositionColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :position, :language
  end
end
