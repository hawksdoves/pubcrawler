pubcrawlerApp.controller('CrawlsController', ['$window', '$state', 'CrawlService', function($window, $state, CrawlService) {

  var self = this;

  self.crawls = [];

  CrawlService.getCrawls()
    .then(function(data) {
      self.crawls = data;
    });

  self.noCrawls = function() {
    return self.crawls.length === 0;
  };

  self.createCrawl = function(crawlData) {
    CrawlService.createCrawl(crawlData)
      .then(function(crawl) {
        $state.go('app.crawlSingle', { id: crawl.id });
      }
    );
  };
}]);
