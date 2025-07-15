class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :user, null: true, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :session_id # For anonymous likes

      t.timestamps
    end
    
    add_index :likes, [:post_id, :user_id], unique: true, where: "user_id IS NOT NULL"
    add_index :likes, [:post_id, :session_id], unique: true, where: "session_id IS NOT NULL"
  end
end
