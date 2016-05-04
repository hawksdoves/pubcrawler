class Pub < ActiveRecord::Base
  belongs_to :crawl

  def self.yelp_query params
  end
end
