class AddNameToCrawl < ActiveRecord::Migration
  def change
    add_column :crawls, :name, :string
  end
end
