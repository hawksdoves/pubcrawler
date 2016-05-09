pubcrawlerApp.controller('CrawlsController', ['$state','CrawlService', function($state, CrawlService) {

  var self = this;

  self.crawls = [{name: "No pubs yet."}];

  CrawlService.getCrawls().then(
    function(data){
      self.crawls = data;
    });

  self.createCrawl = function(crawlData) {
    CrawlService.createCrawl(crawlData);
    $state.go('app.crawls');
  };

}]);
