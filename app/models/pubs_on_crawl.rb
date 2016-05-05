class PubsOnCrawl < ActiveRecord::Base
	belongs_to :pub, dependent: :destroy
	belongs_to :crawl, dependent: :destroy
end
