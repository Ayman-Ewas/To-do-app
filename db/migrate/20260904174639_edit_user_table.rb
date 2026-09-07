class EditUserTable < ActiveRecord::Migration[8.1]
  def change
    rename_table :user, :users
  end
end