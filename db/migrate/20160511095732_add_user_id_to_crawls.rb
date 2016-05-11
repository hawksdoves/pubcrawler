class AddUserIdToCrawls < ActiveRecord::Migration
  def change
    add_reference :crawls, :user, index: true, foreign_key: true
  end
end
