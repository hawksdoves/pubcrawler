describe 'Crawl' do
  it '#index displays a pub' do
    visit '/crawls?location=n16bn'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Pub Crawler')

    within('ul.pub-address') {
      expect(page).to have_content('London')
    }
  end
end
