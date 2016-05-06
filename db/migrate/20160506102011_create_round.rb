class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.time :checkin
      t.boolean :visible
    end
  end
end
