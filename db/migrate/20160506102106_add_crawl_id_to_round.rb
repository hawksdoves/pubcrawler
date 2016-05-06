class AddCrawlIdToRound < ActiveRecord::Migration
  def change
    add_reference :rounds, :crawl, index: true, foreign_key: true
  end
end
