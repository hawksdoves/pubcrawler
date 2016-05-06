class Challenge < ActiveRecord::Base
  has_many :crawl_challenges
  has_many :crawls, through: :crawl_challenges, dependent: :destroy
end
