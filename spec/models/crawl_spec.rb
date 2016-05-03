require 'rails_helper'

RSpec.describe Crawl, type: :model do

  subject(:crawl) { described_class.new }
  let(:array) { [] }

  it 'returns one pub' do
    expect(array).to receive(:sample)
    Crawl.pub_picker(array)
  end

  it 'creates a new pub object' do
    
  end
end
