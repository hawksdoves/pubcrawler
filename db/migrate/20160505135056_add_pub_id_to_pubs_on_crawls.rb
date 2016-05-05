class AddPubIdToPubsOnCrawls < ActiveRecord::Migration
  def change
    add_reference :pubs_on_crawls, :pub, index: true, foreign_key: true
  end
end
