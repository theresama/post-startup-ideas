class AddForeignUserKeyToIdea < ActiveRecord::Migration
  def change
  	add_foreign_key :ideas, :users
  	add_index :ideas, [:user_id, :created_at]
  end
end
