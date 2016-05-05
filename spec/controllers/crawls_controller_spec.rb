require 'rails_helper'

RSpec.describe CrawlsController, type: :controller do

	subject(:crawls_controller) { described_class.new }

	it 'generates a new pub when new crawl created' do
		expect(Crawl).to receive(:new_pubs).and_return([PubsOnCrawl.new])
		post :create, crawl: { "name"=>"happyKitty", "start_postcode"=>"abc123"}
	end
end
