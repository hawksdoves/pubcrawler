class CreateCrawlPub < ActiveRecord::Migration
  def change
    create_table :crawl_pubs do |t|
      t.time :checkin
      t.boolean :visible
    end
  end
end
