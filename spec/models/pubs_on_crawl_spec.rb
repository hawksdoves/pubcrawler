require 'rails_helper'

RSpec.describe PubsOnCrawl, type: :model do

    it{ is_expected.to belong_to(:pub) }
    it{ is_expected.to belong_to(:crawl) }

    describe '#find_and_update_status' do

    	it 'changes checkin attribute' do
    		pub = PubsOnCrawl.create
            pub1 = PubsOnCrawl.create
    		time = Time.new(2000,01,01,04,05)
    		allow(Time).to receive(:now).and_return(time)
    		PubsOnCrawl.find_and_update_status(pub.id)
    		expect(PubsOnCrawl.first.checkin).to eq time
    	end

        it 'changes visibility attribute' do
          pub = PubsOnCrawl.create
          pub1 = PubsOnCrawl.create
          PubsOnCrawl.find_and_update_status(pub.id)
          expect(PubsOnCrawl.last.visible).to eq true
        end

    end
end
