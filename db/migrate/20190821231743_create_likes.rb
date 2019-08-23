class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.integer :api_key
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
