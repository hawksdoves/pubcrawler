describe('Home page', function() {
  it('has a title', function() {
    browser.get('/');
    expect(browser.getTitle()).toEqual('All Crawls');
  });
});
