class PubChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :pub

  def self.get_challenge
    Challenge.all.sample
  end
end
