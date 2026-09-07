class RemoveTasksColumn < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :tasks, :string
  end
end
