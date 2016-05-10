class AddMobNumberToCrawls < ActiveRecord::Migration
  def change
    add_column :crawls, :mob_number, :string
  end
end
