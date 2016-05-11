class Crawl < ActiveRecord::Base
  belongs_to :user
  has_many :rounds
  has_many :pubs, through: :rounds
  has_many :challenges, through: :rounds

  def self.get_pubs postcode
    self.yelp_pubs_near(postcode).shuffle[0..8].map do |pub|
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
    end
  end

  def self.get_challenges
    Challenge.all.shuffle[0..8]
  end

  private

  def self.yelp_pubs_near postcode
    Yelp.client.search(postcode, { term: 'bars and pubs', radius_filter: 800 }).businesses
  end
end
