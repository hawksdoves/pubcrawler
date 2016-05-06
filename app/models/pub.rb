class Pub < ActiveRecord::Base
  has_many :crawl_pubs
  has_many :crawls, through: :crawl_pubs, dependent: :destroy
end
