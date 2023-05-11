class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string     :last_name,    null: false
      t.string     :first_name,   null: false
      t.string     :phone_number, null: false
      t.string     :email,        null: false, unique: true
      t.text       :message       
      t.references :booking,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
