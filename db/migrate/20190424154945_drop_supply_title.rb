class DropSupplyTitle < ActiveRecord::Migration[5.2]
  def change
    remove_column :supplies, :title, :string
  end
end
