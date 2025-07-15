class AddSessionIdToLikes < ActiveRecord::Migration[8.0]
  def change
    add_column :likes, :session_id, :string
  end
end
