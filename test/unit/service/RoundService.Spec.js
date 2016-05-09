describe('RoundService', function(){
  beforeEach(module('pubcrawlerApp'));

  var RoundService, httpBackend;

  var updateData = { id: 1 };

  beforeEach( inject( function(_RoundService_, $httpBackend) {
    RoundService = _RoundService_;
    httpBackend = $httpBackend;
  }));

  it('should send update data to api', function() {

    httpBackend
    .whenPATCH('http://localhost:3000/rounds/' + updateData.id).respond({
      status: 200
    });

    RoundService.updateRound(updateData)
      .then(function(response) {
        expect(response.status).toEqual(200);
      });
  });
});
