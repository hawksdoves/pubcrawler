require 'rails_helper'

RSpec.describe Pub, type: :model do
  it{ is_expected.to have_many(:rounds) }
end
