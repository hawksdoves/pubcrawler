class AddNumberToCrawls < ActiveRecord::Migration
  def change
    add_column :crawls, :number, :string
  end
end
