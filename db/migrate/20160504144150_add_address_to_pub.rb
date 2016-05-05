class AddAddressToPub < ActiveRecord::Migration
  def change
    add_column :pubs, :address, :string, array: true, default: []
  end
end
