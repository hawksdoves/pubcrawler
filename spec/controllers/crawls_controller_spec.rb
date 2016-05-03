require 'rails_helper'

RSpec.describe CrawlsController, type: :controller do
  let(:location) { double(:String) }
  let(:client) { double(:yelp, search: "Hello World") }

  subject(:crawls_controller) { described_class.new }

  it 'passes location to yelp api' do
    expect(client).to receive(:search).with('n16bn', { term: 'bars and pubs' })
    allow(crawls_controller).to receive(:location_params).and_return('n16bn')
    allow(Yelp).to receive(:client).and_return(client)
    crawls_controller.new
  end



  # check that function grabs and sort information from returned repsonse

end
