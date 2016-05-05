class AddShowToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :show, :boolean
  end
end
