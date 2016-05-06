feature 'Feature Spec: Crawl' do
  xscenario 'user can create a new crawl' do
    20.times { Challenge.create }
    visit '/crawls/new'
    expect(page.status_code).to eq 200
    fill_in('crawl_name', with: 'new_crawl')
    fill_in('crawl_start_postcode', with: 'n16bn')
    click_button('Create')
    expect(page.status_code).to eq 200
    expect(page).to have_content('new_crawl')
    expect(page).to have_content('Pub Name:', count: 1)
    expect(page).to have_content('Pub Address:')
  end
end
