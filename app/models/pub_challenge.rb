class PubChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :pub

  def self.new_challenge
    Challenge.new
  end
end
