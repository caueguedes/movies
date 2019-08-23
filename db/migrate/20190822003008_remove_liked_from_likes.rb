class RemoveLikedFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :liked, :boolean
  end
end
