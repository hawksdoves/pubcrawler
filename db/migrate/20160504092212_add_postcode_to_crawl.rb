class AddPostcodeToCrawl < ActiveRecord::Migration
  def change
    add_column :crawls, :start_postcode, :string
  end
end
