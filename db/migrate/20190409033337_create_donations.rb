class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.text :address
      t.integer :user_id
      t.text :tags
      t.datetime :post_time
    end
  end
end
