class Round < ActiveRecord::Base
	belongs_to :pub
	belongs_to :crawl
	belongs_to :challenge

	def self.checkin id
			Round.update(id, checkin: Time.now)
			Round.update(id.to_i+1, visible: true)
	end

	def self.get_challenges
    Challenge.all.shuffle[0..8]
  end
end
