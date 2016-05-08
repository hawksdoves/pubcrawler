describe('CrawlService', function(){
  beforeEach(module('pubcrawlerApp'));

  var CrawlService, httpBackend;

  var crawlsData = [{name: 'Crawl1', start_postcode: 'postcode1' },{name: 'Crawl1', start_postcode: 'postcode1' }];

  beforeEach( inject( function(_CrawlService_, $httpBackend) {
    CrawlService = _CrawlService_;
    httpBackend = $httpBackend;
  }));

  describe('#getCrawls', function(){

    it('should get crawls from api', function() {
      httpBackend.expectGET('http://localhost:3000/crawls/').respond(crawlsData);
      CrawlService.getCrawls()
        .then(function(response) {
          expect(response.data).toEqual(crawlsData);
        });
    });
  });
});
