class AddCrawlIdToPubs < ActiveRecord::Migration
  def change
    add_reference :pubs, :crawl, index: true, foreign_key: true
  end
end
