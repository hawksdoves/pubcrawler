feature 'Feature Spec: Crawl' do
  scenario 'user can create a new crawl' do
    visit '/crawls'
    click_link('New Crawl')
    expect(page.status_code).to eq 200
    fill_in('crawl_name', with: 'new_crawl')
    fill_in('crawl_start_postcode', with: 'n16bn')
    click_button('Create')
    expect(page.status_code).to eq 200
    expect(page).to have_content('new_crawl')
    expect(page).to have_content('Pub Name:')
    expect(page).to have_content('Pub Address:')
  end
end
