class AddCrawlIdToCrawlPub < ActiveRecord::Migration
  def change
    add_reference :crawl_pubs, :crawl, index: true, foreign_key: true
  end
end
