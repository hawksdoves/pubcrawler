require 'rails_helper'

RSpec.describe PubChallenge, type: :model do

  it{ is_expected.to belong_to(:pub) }
  it{ is_expected.to belong_to(:challenge) }

  it 'is expected to return a random challenge' do
    Challenge.create
    expect(PubChallenge.get_challenge).to be_a Challenge
  end
end
