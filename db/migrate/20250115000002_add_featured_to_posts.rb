class AddFeaturedToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :featured, :boolean, default: false
    add_index :posts, :featured
  end
end