class Challenge < ActiveRecord::Base
  has_many :crawl_challenges, dependent: :destroy
end
