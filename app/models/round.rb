class Round < ActiveRecord::Base
	belongs_to :pub
	belongs_to :crawl
	belongs_to :challenge

	def self.log_time id
		Round.update(id, checkin: Time.now)
	end

	def self.reveal id
		Round.update(id.to_i, visible: true)
	end
end
