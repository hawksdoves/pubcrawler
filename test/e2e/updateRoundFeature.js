describe('Round page', function() {
  it('will reveal the next pub', function() {

    var visibleRounds = function(){
      return $$('.round').length;
    };

    browser.get('/#/app/crawls/new');
    $('#crawl-name').sendKeys('new pub crawl');
    $('#crawl-start').sendKeys('n16bn');
    $('#crawl-create').click();
    expect(visibleRounds()).toEqual(1);
    $$('.round').first().click();
    $('#checkin').click();
    expect(visibleRounds()).toEqual(2);
  });
});
