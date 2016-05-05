require 'rails_helper'

RSpec.describe PubsOnCrawl, type: :model do
    it{ is_expected.to belong_to(:pub) }
    it{ is_expected.to belong_to(:crawl) }
end
