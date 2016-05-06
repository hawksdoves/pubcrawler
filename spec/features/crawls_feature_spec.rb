feature 'Feature Spec: Crawl' do
  scenario 'user can create a new crawl which displays the first place' do
    20.times { Challenge.create }
    visit '/crawls'
    click_link('New Crawl')
    expect(page.status_code).to eq 200
    fill_in('crawl_name', with: 'new_crawl')
    fill_in('crawl_start_postcode', with: 'n16bn')
    click_button('Create')
    expect(page.status_code).to eq 200
    expect(page).to have_content('new_crawl')
    expect(page).to have_content('Pub Name:', count: 1)
    expect(page).to have_content('Pub Address:')
  end

  xscenario 'when user clicks check in button, it show the next pub' do
    visit '/crawls'
    click_link('New Crawl')
    expect(page.status_code).to eq 200
    fill_in('crawl_name', with: 'new_crawl')
    fill_in('crawl_start_postcode', with: 'n16bn')
    click_button('Create')
    expect(page.status_code).to eq 200
    click_button('Check in')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Pub Name:', count: 2)
  end
end
