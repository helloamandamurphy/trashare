class CreateCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :creations do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.text :directions
      t.integer :user_id
      t.text :tags
    end
  end
end
