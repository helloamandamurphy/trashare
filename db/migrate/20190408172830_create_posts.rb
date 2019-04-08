class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.text :address
      t.integer :user_id
      t.string :tags
    end
  end
end
