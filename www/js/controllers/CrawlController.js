pubcrawlerApp.controller('CrawlController', ['$state', 'CrawlService', function($state, CrawlService) {
  var self = this;

  self.createCrawl = function(crawlData) {
    CrawlService.createCrawl(crawlData);
    $state.go('app.crawls');
  };
}]);
