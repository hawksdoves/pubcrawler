require 'rails_helper'

RSpec.describe Round, type: :model do
    it{ is_expected.to belong_to(:pub) }
    it{ is_expected.to belong_to(:crawl) }
    it{ is_expected.to belong_to(:challenge) }

    describe '#checkin' do
    	it 'changes checkin attribute' do
        round = Round.create
        Round.create
    		time = Time.new(2000,01,01,04,05)
    		allow(Time).to receive(:now).and_return(time)
    		Round.log_time round.id
    		expect(Round.first.checkin).to eq time
    	end
    end
end
