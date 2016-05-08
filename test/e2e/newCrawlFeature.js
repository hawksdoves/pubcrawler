describe('Home page', function() {
  it('has a title', function() {
    browser.get('/#/app/crawls/new');
    expect(browser.getTitle()).toEqual('New Crawl');

    $('#crawl-name').clear().sendKeys('new pub crawl');
    $('#crawl-start').clear().sendKeys('n16bn');
    $('#crawl-create').click();

    var crawlData = $$('.crawls').first();
    expect(crawlData.getText()).toMatch('new pub crawl');
    expect(crawlData.getText()).toMatch('n16bn');
  });
});
