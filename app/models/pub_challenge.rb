class PubChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :pub

  def self.get_challenges
    Challenge.all.shuffle[0..8]
  end
end
