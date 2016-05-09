describe('Seeing all Crawls created', function() {
  it('has a list of crawls', function() {
    browser.get('/#/app/crawls');
    expect(browser.getTitle()).toEqual('All Crawls');
  });
});
