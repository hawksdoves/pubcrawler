require 'rails_helper'

RSpec.describe RoundsController, type: :controller do
	it 'updates proceeding round visibility when current round is checked into' do
		crawl = Crawl.create
		round = Round.create
		crawl.rounds << round
		expect(Round).to receive(:log_time)
		post :update, id: round.id
	end
end
