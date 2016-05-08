xdescribe('CrawlController', function() {
  beforeEach(module('pubcrawlerApp'));

    var ctrl, CrawlService;

  beforeEach(inject(function($controller, _CrawlService_) {
    ctrl = $controller('CrawlController');
    CrawlService = _CrawlService_;
  }));

  it('should do this and that', function() {
    ctrl.createCrawl(null);
    expect(CrawlService.createCrawl()).toHaveBeenCalled();
  });
});
