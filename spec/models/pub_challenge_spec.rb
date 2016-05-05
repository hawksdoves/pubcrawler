require 'rails_helper'

RSpec.describe PubChallenge, type: :model do

  it{ is_expected.to belong_to(:pub) }
  it{ is_expected.to belong_to(:challenge) }

  it '#get_challenges is expected to return a random challenge' do
    challenge = Challenge.create
    expect(PubChallenge.get_challenges).to include challenge
  end
end
