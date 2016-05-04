require 'rails_helper'

RSpec.describe CrawlsController, type: :controller do

	subject(:crawls_controller) { described_class.new }
	# let(:params) { double(:parameters, require: require_method) }
	# let(:require_method) { double(:require, permit: { "name"=>"happyKitty", "start_postcode"=>"abc123"} ) }
	# let(:crawl) { double(:crawl, save: true, pubs: []) }



	it 'generates a new pub when new crawl created' do
		expect(Pub).to receive(:yelp_query).and_return(Pub.new)
		post :create, crawl: { "name"=>"happyKitty", "start_postcode"=>"abc123"}
	end
end
