class PubChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :pub
end
