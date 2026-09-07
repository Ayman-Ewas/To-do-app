class CreateUser < ActiveRecord::Migration[8.1]
  def change
    create_table :user do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :username, null: false
      t.timestamps
    end

    add_index :user, :email, unique: true
    add_index :user, :username, unique: true
  end
end

