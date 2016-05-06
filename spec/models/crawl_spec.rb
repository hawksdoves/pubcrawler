require 'rails_helper'

RSpec.describe Crawl, type: :model do
  let(:location) { double :String }
  let(:coordinate) { double(:coordinates, longitude: 51.141155,latitude: 0.11245262) }
  let(:location_details) { double(:location_details, postal_code: 'abc123', display_address: ['Line 1', 'Line 2', 'Line 3'], coordinate: coordinate ) }
  let(:details2) { double(:details, name: 'The Pub Name', id: 'pub1', location: location_details) }
  let(:details) { double(:details, name: 'The Pub Name', id: 'pub1', location: location_details) }
  let(:search) { double(:search, businesses: [details, details2]) }
  let(:client) { double(:yelp, search: search) }
  let(:postcode) { double :String }

  subject(:crawl) { described_class.new }

  it{ is_expected.to have_many(:pubs_on_crawls) }
  it{ is_expected.to have_many(:crawl_challenges) }

  # need to change db table name
  xit{ is_expected.not_to have_many(:pubs_on_crawls) }
  xit{ is_expected.to have_many(:crawl_pubs) }

  before do
    allow(Yelp).to receive(:client).and_return(client)
  end

  context 'creating a new crawl' do
    it 'makes a query to yelp api' do
      expect(client).to receive(:search).with(postcode, { term: 'bars and pubs', radius_filter: 800 })
      Crawl.new_pubs postcode
    end

    it 'returns one pub near postcode with details from yelp' do
      new_pubs = Crawl.new_pubs postcode
      expect(new_pubs.first.pub.name).to eq details.name
    end

    it 'returns an array of pubs' do
      new_pubs = Crawl.new_pubs postcode
      expect(new_pubs.length).to eq 2
    end

    it 'first pub has show true' do
      new_pubs = Crawl.new_pubs postcode
      expect(new_pubs.first.visible).to eq true
    end

  end
end
