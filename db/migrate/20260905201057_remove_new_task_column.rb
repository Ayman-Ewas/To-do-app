class RemoveNewTaskColumn < ActiveRecord::Migration[8.1]
   def change
     remove_column :tasks, :New_task, :text
   end
 end