class Crawl < ActiveRecord::Base
  has_many :pubs, dependent: :destroy

  def self.new_pubs postcode
    pubs = self.yelp_pubs_near(postcode)
    pubs.shuffle[0..8].map do |pub,index|
      if index == 0
        Pub.create(name: pub.name,
                  location: pub.location.postal_code,
                  address: pub.location.display_address,
                  longitude: pub.location.coordinate.longitude,
                  latitude: pub.location.coordinate.latitude,
                  checked_in: false,
                  show: true )
      else
      Pub.create(name: pub.name,
                location: pub.location.postal_code,
                address: pub.location.display_address,
                longitude: pub.location.coordinate.longitude,
                latitude: pub.location.coordinate.latitude,
                checked_in: false,
                show: false )
      end
    end
  end

  private

  def self.yelp_pubs_near postcode
    Yelp.client.search(postcode, { term: 'bars and pubs', radius_filter: 800 }).businesses
  end
end
