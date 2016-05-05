class CreateChallenge < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :details
      t.time :time_allocation
    end
  end
end
