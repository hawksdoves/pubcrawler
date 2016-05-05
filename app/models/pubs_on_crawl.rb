class PubsOnCrawl < ActiveRecord::Base
	belongs_to :pub, dependent: :destroy
	belongs_to :crawl, dependent: :destroy

	def self.find_and_update_status id
			PubsOnCrawl.update(id, checkin: Time.now)
			PubsOnCrawl.update(id.to_i+1, visible: true)
	end

end
