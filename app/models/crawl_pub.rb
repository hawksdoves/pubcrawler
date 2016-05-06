class CrawlPub < ActiveRecord::Base
	belongs_to :pub, dependent: :destroy
	belongs_to :crawl, dependent: :destroy

	def self.checkin id
			CrawlPub.update(id, checkin: Time.now)
			CrawlPub.update(id.to_i+1, visible: true)
	end
end
