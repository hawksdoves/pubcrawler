require 'rails_helper'

RSpec.describe PubsOnCrawlController, type: :controller do

	subject(:pubs_on_crawl_controller) { described_class.new }

	it 'generates a new pub when new crawl created' do
		crawl = Crawl.create
		pub = PubsOnCrawl.create
		crawl.pubs_on_crawls << pub
		expect(PubsOnCrawl).to receive(:find_and_update_status)
		post :update, id: pub.id
	end

end
