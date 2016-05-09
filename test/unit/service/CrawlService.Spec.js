describe('CrawlService', function(){
  beforeEach(module('pubcrawlerApp'));

  var CrawlService, httpBackend;

  var crawlData = { name: 'NameOfNewCrawl', start_postcode: 'postcode' };

  beforeEach( inject( function(_CrawlService_, $httpBackend) {
    CrawlService = _CrawlService_;
    httpBackend = $httpBackend;
  }));

  describe('#createCrawl', function(){
    it('should post crawl to api', function() {

      httpBackend
      .whenPOST('/crawls', crawlData).respond({
        name: 'NameOfNewCrawl'
      });

      CrawlService.createCrawl(crawlData)
        .then(function(response) {
          expect(response.data).toEqual({ name: 'NameOfNewCrawl' });
        });
    });
  });

  describe('#getCrawls', function(){

    it('should get crawls from api', function() {
      httpBackend.expectGET('http://localhost:3000/crawls/').respond(crawlData);
      CrawlService.getCrawls()
        .then(function(result) {
          expect(result).toEqual(crawlData);
        });
    });
  });
});
