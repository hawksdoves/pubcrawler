class Pub < ActiveRecord::Base
  belongs_to :crawl
  has_many :pub_challenges, dependent: :destroy
end
