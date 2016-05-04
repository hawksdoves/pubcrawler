require 'rails_helper'

RSpec.describe Crawl, type: :model do
  let(:array) { [] }
  let(:location) { double(:String) }
  let(:client) { double(:yelp, search: "Hello World") }

  subject(:crawl) { described_class.new }

  it{ is_expected.to have_many(:pubs) }

  it 'passes location to yelp api' do
    expect(client).to receive(:search).with('User Location', { term: 'bars and pubs' })
    allow(Yelp).to receive(:client).and_return(client)
    Crawl.yelp_query({ start_postcode: 'User Location' })
  end

  it 'returns one pub' do
    expect(array).to receive(:sample)
    Crawl.pub_picker(array)
  end

  it 'creates a new pub record' do
    #
  end

end
