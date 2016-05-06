describe('PlaylistsCtrl', function() {
// Load the module with ContainerContactCtrl, add your module name in here!
  beforeEach(module('starter'));

    var ctrl;

  // inject the $controller and $rootScope services
  // in the beforeEach block
  beforeEach(inject(function($controller) {
    ctrl = $controller('PlaylistsCtrl');
  }));

  it('should do this and that', function() {
    // console.log(self.playlists)
    expect(self.playlists[0].title).toEqual("Reggae");
  });
});
