describe('Home page', function() {
  it('has a title', function() {
    browser.get('/#/app/crawls/new');
    expect(browser.getTitle()).toEqual('New Crawl');

    $('#crawl-name').sendKeys('new pub crawl');
    $('#crawl-start').sendKeys('n16bn');
    $('#crawl-create').click();

    expect(browser.getTitle()).toEqual('All Crawls');
  });
});