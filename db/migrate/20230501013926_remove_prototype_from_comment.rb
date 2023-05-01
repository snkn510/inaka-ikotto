class RemovePrototypeFromComment < ActiveRecord::Migration[6.0]
  def change
    remove_reference :comments, :prototype, null: false
  end
end
