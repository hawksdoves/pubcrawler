describe('Home page', function() {
  it('has a title', function() {
    // We don't need to put in the full url as we set baseUrl in our config
    browser.get('/');
    expect(browser.getTitle()).toEqual('Playlists');
  });
});
