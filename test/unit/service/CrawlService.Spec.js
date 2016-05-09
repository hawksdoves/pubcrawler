describe('CrawlService', function(){
  beforeEach(module('pubcrawlerApp'));

  var CrawlService, httpBackend;

  var crawlData = { name: 'NameOfNewCrawl', start_postcode: 'postcode' };

  beforeEach( inject( function(_CrawlService_, $httpBackend) {
    CrawlService = _CrawlService_;
    httpBackend = $httpBackend;
  }));

  it('should post crawl to api', function() {

    httpBackend
    .whenPOST('/crawls', crawlData).respond({
      status: 200
    });


    CrawlService.createCrawl(crawlData)
      .then(function(response) {
        expect(response.status).toEqual(200);
      });
  });
});
