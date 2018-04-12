class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :chore
      t.integer :user_id # because chores belongs to a specific user
      t.timestamps null: false
    end
  end
end
