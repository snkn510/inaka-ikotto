class ChangeUnreadToReadInMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :unread, :read
    change_column_default :messages, :read, nil
  end
end
