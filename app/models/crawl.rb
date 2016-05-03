class Crawl < ActiveRecord::Base
  has_many :pubs, dependent: :destroy

  def self.pub_picker(array)
    array.sample
  end

  def self.yelp_query params
    Yelp.client.search(params[:location], { term: 'bars and pubs' })
  end
end
