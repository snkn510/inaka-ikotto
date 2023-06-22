class DropMessages < ActiveRecord::Migration[6.0]
  def change
    drop_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :body
    end
  end
end
