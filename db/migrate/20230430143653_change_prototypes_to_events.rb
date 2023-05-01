class ChangePrototypesToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_table :prototypes, :events
  end
end
