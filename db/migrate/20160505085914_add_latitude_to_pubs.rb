class AddLatitudeToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :latitude, :decimal, precision: 15, scale: 12
  end
end
