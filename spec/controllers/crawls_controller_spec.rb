require 'rails_helper'

RSpec.describe CrawlsController, type: :controller do

  let(:challenge) { double(:Challenge, id: 1) }
  let(:postcode) { double :String }
  let(:crawl_name) { double :String }

  subject(:crawls_controller) { described_class.new }

  before do
    allow(Crawl).to receive(:new_pubs).and_return([Pub.new, Pub.new])
  end

  context 'when creating a new crawl' do
    # it 'gets a new set of pubs' do
    #   expect(Crawl).to receive(:new_pubs).and_return([Pub.new, Pub.new])
    #   post :create, crawl: { "name"=>"New Crawl", "start_postcode"=>"post_code"}
    # end

    it 'gets a new of challenge' do
      expect(PubChallenge).to receive(:get_challenge).and_return( challenge )
      post :create, crawl: { "name"=>crawl_name, "start_postcode"=>postcode}
    end
  end
end
