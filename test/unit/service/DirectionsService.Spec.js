describe('DirectionsService', function(){
  beforeEach(module('pubcrawlerApp'));

  var DirectionsService, httpBackend;

  var updateData = { id: 1 };

  beforeEach( inject( function(_DirectionsService_, $httpBackend) {
    DirectionsService = _DirectionsService_;
    httpBackend = $httpBackend;
  }));

  it('should call showMap on DirectionsService', function() {


  });
});
