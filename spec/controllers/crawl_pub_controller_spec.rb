require 'rails_helper'

RSpec.describe CrawlPubsController, type: :controller do
	it 'updates proceeding pub visibility when current pub is checked into' do
		crawl = Crawl.create
		pub_link = CrawlPub.create
		crawl.crawl_pubs << pub_link
		expect(CrawlPub).to receive(:checkin)
		post :update, id: pub_link.id
	end
end
