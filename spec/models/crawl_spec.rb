require 'rails_helper'

RSpec.describe Crawl, type: :model do
  let(:array) { [] }
  let(:location) { double :String }
  let(:location_details) { double(:location_details, postal_code: 'abc123', display_address: ['Line 1', 'Line 2', 'Line 3']) }
  let(:details) { double(:details, name: 'The Pub Name', id: 'pub1', location: location_details) }
  let(:search) { double(:search, businesses: [details]) }
  let(:client) { double(:yelp, search: search) }
  let(:postcode) { double :String }
  let(:pub) { double :Pub }

  subject(:crawl) { described_class.new }

  it{ is_expected.to have_many(:pubs) }

  before do
    allow(Yelp).to receive(:client).and_return(client)
  end

  context 'creating a new pub' do
    it 'makes a query to yelp api' do
      expect(client).to receive(:search).with(postcode, { term: 'bars and pubs' })
      Crawl.new_pub postcode
    end

    it 'returns one pub near postcode with details from yelp' do
      new_pub = Crawl.new_pub postcode
      expect(new_pub.name).to eq details.name
    end
  end


end
