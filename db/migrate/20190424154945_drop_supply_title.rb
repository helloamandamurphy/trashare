class DropSupplyTitle < ActiveRecord::Migration[5.2]
  def change
    remove_column :supply, :title, :string
  end
end
