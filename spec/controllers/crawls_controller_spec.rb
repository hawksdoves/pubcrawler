require 'rails_helper'

RSpec.describe CrawlsController, type: :controller do

  subject(:crawls_controller) { described_class.new }

  it 'generates a new pub when new crawl created' do
    expect(Crawl).to receive(:new_pubs).and_return([Pub.new])
    post :create, crawl: { "name"=>"New Crawl", "start_postcode"=>"post_code"}
  end
end
