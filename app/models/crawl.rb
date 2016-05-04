class Crawl < ActiveRecord::Base
  has_many :pubs, dependent: :destroy

  def self.pub_picker(array)
    array.sample
  end

  def self.new_pubs postcode
    pubs = self.yelp_pubs_near(postcode)
    pubs[0..8].map do |pub|
      Pub.create(name: pub.name, location: pub.location.postal_code, address: pub.location.display_address)
    end
  end

  private

  def self.yelp_pubs_near postcode
    Yelp.client.search(postcode, { term: 'bars and pubs', radius_filter: 800 }).businesses
  end
end
