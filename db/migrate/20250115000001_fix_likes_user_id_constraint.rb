class FixLikesUserIdConstraint < ActiveRecord::Migration[8.0]
  def change
    change_column_null :likes, :user_id, true
    add_index :likes, [:post_id, :session_id], unique: true, where: "session_id IS NOT NULL", if_not_exists: true
  end
end