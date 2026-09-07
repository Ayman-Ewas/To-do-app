class RemoveStatusTable < ActiveRecord::Migration[8.1]
  def change
    drop_table :statuses
  end
end