require 'rails_helper'

RSpec.describe Challenge, type: :model do
  it{ is_expected.to have_many(:rounds) }
end
