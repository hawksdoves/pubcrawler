require 'rails_helper'

RSpec.describe Pub, type: :model do
  it{ is_expected.not_to have_many(:pub_challenges) }
end
