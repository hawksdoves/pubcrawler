class CrawlPub < ActiveRecord::Base
	belongs_to :pub
	belongs_to :crawl

	def self.checkin id
			CrawlPub.update(id, checkin: Time.now)
			CrawlPub.update(id.to_i+1, visible: true)
	end
end
