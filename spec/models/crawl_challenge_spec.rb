require 'rails_helper'

RSpec.describe CrawlChallenge, type: :model do
  it{ is_expected.to belong_to(:crawl) }
  it{ is_expected.to belong_to(:challenge) }

  it '#get_challenges is expected to return a random set of challenges' do
    challenge = Challenge.create
    expect(CrawlChallenge.get_challenges).to include challenge
  end
end
