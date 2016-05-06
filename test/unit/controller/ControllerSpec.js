describe('PlaylistsCtrl', function() {
  beforeEach(module('Pubcrawler'));

    var ctrl;

  beforeEach(inject(function($controller) {
    ctrl = $controller('PlaylistsCtrl');
  }));

  it('should do this and that', function() {
    expect(self.playlists[0].title).toEqual("Reggae");
  });
});
