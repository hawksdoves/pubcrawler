class AddCheckedInToPubs < ActiveRecord::Migration
  def change
    add_column :pubs, :checked_in, :boolean
  end
end
