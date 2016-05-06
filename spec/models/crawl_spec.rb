require 'rails_helper'

RSpec.describe Crawl, type: :model do
  let(:location) { double :String }
  let(:coordinate) { double(:coordinates, longitude: 123,latitude: 123) }
  let(:location_details) { double(:location_details, postal_code: 'postcode', display_address: ['address line 1', 'address line 2', 'address line 3'], coordinate: coordinate ) }
  let(:details2) { double(:details, name: 'The Pub Name', id: 'pub1', location: location_details) }
  let(:details) { double(:details, name: 'The Pub Name', id: 'pub1', location: location_details) }
  let(:search) { double(:search, businesses: [details, details2]) }
  let(:client) { double(:yelp, search: search) }
  let(:postcode) { double :String }

  subject(:crawl) { described_class.new }

  it{ is_expected.to have_many(:rounds) }
  it{ is_expected.to have_many(:challenges) }
  it{ is_expected.to have_many(:pubs) }

  before do
    allow(Yelp).to receive(:client).and_return(client)
  end

  it 'changes visibility attribute' do
    round = Round.create
    Round.create
    Round.reveal_next round.id
    expect(Round.last.visible).to eq true
  end

  describe '#get_' do
    it 'challenges returns an array of challenges' do
      challenge = Challenge.create
      expect(Crawl.get_challenges).to include challenge
    end

    context 'pubs' do
      it 'returns an array of pubs' do
        pubs = Crawl.get_pubs postcode
        expect(pubs.length).to eq 2
      end

      it 'makes a query to yelp api' do
        expect(client).to receive(:search).with(postcode, { term: 'bars and pubs', radius_filter: 800 })
        Crawl.get_pubs postcode
      end

      it 'returns one pub near postcode with details from yelp' do
        pubs = Crawl.get_pubs postcode
        expect(pubs.first.name).to eq details.name
      end
    end
  end
end
