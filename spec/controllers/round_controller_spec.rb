require 'rails_helper'

RSpec.describe RoundsController, type: :controller do

  let(:crawl) { Crawl.create }
  let(:round) { Round.create }

	before do
		allow(Round).to receive(:log_time)
		allow(Round).to receive(:reveal_next)
	end

	it 'updates round visibility when checked into' do
		crawl.rounds << round
		expect(Round).to receive(:log_time)
		post :update, id: round.id
	end

	it 'updates checkin time' do
		crawl.rounds << round
		expect(Round).to receive(:reveal_next)
		post :update, id: round.id
	end
end
