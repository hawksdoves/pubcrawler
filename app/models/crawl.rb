class Crawl < ActiveRecord::Base
  has_many :pubs, dependent: :destroy

  def self.new_pubs postcode
    pubs = self.yelp_pubs_near(postcode)
    pubs.shuffle[0..8].map.with_index do |pub,index|
      default_show = (index == 0) ?  true : false
      Pub.create(name: pub.name,
                location: pub.location.postal_code,
                address: pub.location.display_address,
                longitude: pub.location.coordinate.longitude,
                latitude: pub.location.coordinate.latitude
                # ,checked_in: false,
                # show: default_show
                )
    end
  end

  private

  def self.yelp_pubs_near postcode
    Yelp.client.search(postcode, { term: 'bars and pubs', radius_filter: 800 }).businesses
  end
end
