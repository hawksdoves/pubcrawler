class AddCrawlIdToPubsOnCrawls < ActiveRecord::Migration
  def change
    add_reference :pubs_on_crawls, :crawl, index: true, foreign_key: true
  end
end
