class CrawlChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :crawl

  def self.get_challenges
    Challenge.all.shuffle[0..8]
  end
end
