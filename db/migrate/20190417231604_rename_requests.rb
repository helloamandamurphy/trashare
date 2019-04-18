class RenameRequests < ActiveRecord::Migration[5.2]
  def change
    rename_table :requests, :supplies
  end
end
