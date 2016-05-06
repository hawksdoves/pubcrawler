class Round < ActiveRecord::Base
	belongs_to :pub
	belongs_to :crawl
	belongs_to :challenge

	def self.log_time id
		Round.update(id, checkin: Time.now)
	end

	def self.reveal_next id
		Round.update(id.to_i+1, visible: true)
	end
end
