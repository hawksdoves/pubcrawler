require 'rails_helper'

RSpec.describe CrawlPub, type: :model do
    it{ is_expected.to belong_to(:pub) }
    it{ is_expected.to belong_to(:crawl) }

    describe '#checkin' do
    	it 'changes checkin attribute' do
        pub = CrawlPub.create
        CrawlPub.create
    		time = Time.new(2000,01,01,04,05)
    		allow(Time).to receive(:now).and_return(time)
    		CrawlPub.checkin pub.id
    		expect(CrawlPub.first.checkin).to eq time
    	end

      it 'changes visibility attribute' do
        pub = CrawlPub.create
        CrawlPub.create
        CrawlPub.checkin pub.id
        expect(CrawlPub.last.visible).to eq true
      end
    end
end
