pubcrawlerApp.controller('CrawlsController', ['$window', '$state', 'CrawlService', function($window, $state, CrawlService) {

  var self = this;

  self.crawls = [{name: "No pubs yet."}];

  CrawlService.getCrawls()
    .then(function(data) {
      self.crawls = data;
    });

  self.createCrawl = function(crawlData) {
    CrawlService.createCrawl(crawlData)
      .then(function(crawl) {
        $window.location.reload(true);
        $state.go('app.crawlSingle', { id: crawl.data.message.id });
      }
    );
  };
}]);
