class AddPriceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :price, :integer, null: false
  end
end
