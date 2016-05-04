class Crawl < ActiveRecord::Base
  has_many :pubs, dependent: :destroy

  def self.pub_picker(array)
    array.sample
  end

  def self.new_pub postcode
    pubs = self.yelp_pubs_near(postcode)
    pub = pubs.sample
    Pub.create(name: pub.name, location: pub.location.postal_code, address: pub.location.display_address)
  end

  private

  def self.yelp_pubs_near postcode
    Yelp.client.search(postcode, { term: 'bars and pubs' }).businesses
  end
end
