class AddTaskStatus < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :status, :string, default: "pending"
  end
end