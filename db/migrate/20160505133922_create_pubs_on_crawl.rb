class CreatePubsOnCrawl < ActiveRecord::Migration
  def change
    create_table :pubs_on_crawls do |t|
      t.time :checkin
      t.boolean :visible
    end
  end
end
