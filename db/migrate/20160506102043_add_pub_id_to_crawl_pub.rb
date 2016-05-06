class AddPubIdToCrawlPub < ActiveRecord::Migration
  def change
    add_reference :crawl_pubs, :pub, index: true, foreign_key: true
  end
end
