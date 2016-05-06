class AddCrawlIdToCrawlChallenge < ActiveRecord::Migration
  def change
    add_reference :crawl_challenges, :crawl, index: true, foreign_key: true
  end
end
