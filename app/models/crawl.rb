class Crawl < ActiveRecord::Base
  has_many :rounds
  has_many :pubs, through: :rounds
  has_many :challenges, through: :rounds

  def self.new_pubs postcode
    pubs = self.yelp_pubs_near(postcode)
    pubs.shuffle[0..8].map.with_index do |pub, index|
	    default_show = (index == 0) ? true : false

			current_pub =
        Pub.find_by(
                      name: pub.name,
                      location: pub.location.postal_code
                    ) ||
        Pub.create(
                    name: pub.name,
                    location: pub.location.postal_code,
                    address: pub.location.display_address,
                    longitude: pub.location.coordinate.longitude,
                    latitude: pub.location.coordinate.latitude
                  )

			Round.create(pub_id: current_pub.id, visible: default_show)
    end
  end

  private

  def self.yelp_pubs_near postcode
    Yelp.client.search(postcode, { term: 'bars and pubs', radius_filter: 800 }).businesses
  end
end
