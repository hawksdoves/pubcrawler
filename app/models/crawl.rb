class Crawl < ActiveRecord::Base
  has_many :pubs, dependent: :destroy

  def self.pub_picker(array)
    array.sample
  end

  def self.yelp_query params
    Yelp.client.search(params[:crawl][:start_postcode], { term: 'bars and pubs' })
  end
end
