require 'rails_helper'

RSpec.describe CrawlsController, type: :controller do
  let(:challenge) { Challenge.new }
  let(:pub) { Pub.new }
  let(:round) { Round.new }
  let(:postcode) { double :String }
  let(:crawl_name) { double :String }

  subject(:crawls_controller) { described_class.new }

  before do
    allow(Crawl).to receive(:get_pubs).and_return([pub])
    allow(Crawl).to receive(:get_challenges).and_return([challenge])
  end

  context 'when creating a new crawl' do
    it 'gets a new set of pubs' do
      expect(Crawl).to receive(:get_pubs).and_return([pub])
      post :create, crawl: { 'name'=>'New Crawl', 'start_postcode'=>'post_code'}
    end

    it 'gets a new challenge' do
      expect(Crawl).to receive(:get_challenges).and_return( [challenge] )
      post :create, crawl: { 'name': crawl_name, 'start_postcode': postcode}
    end

    it 'first round is always visible' do
      post :create, crawl: { 'name': crawl_name, 'start_postcode': postcode}
      expect(Round.first.visible).to eq true
    end
  end
end
