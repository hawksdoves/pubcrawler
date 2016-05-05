require 'rails_helper'

RSpec.describe Pub, type: :model do
  it{ is_expected.to belong_to(:crawl) }
end
