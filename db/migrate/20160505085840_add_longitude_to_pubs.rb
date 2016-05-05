class AddLongitudeToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :longitude, :decimal, precision: 15, scale: 12
  end
end
