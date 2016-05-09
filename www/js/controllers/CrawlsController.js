pubcrawlerApp.controller('CrawlsController', ['$state','CrawlService', function($state, CrawlService, $location) {

  var self = this;

  self.crawls = [{name: "No pubs yet."}];

  self.paramId = $state.params.id;

  CrawlService.getCrawls().then(
    function(data){
      self.crawls = data;
    });

  self.createCrawl = function(crawlData) {
    CrawlService.createCrawl(crawlData).then(
      function(crawl){
        console.log('crawl');
        console.log(crawl.data.message);
        console.log(crawl.data.message.id);
        $state.go('app.crawlSingle', {id: crawl.data.message.id});
      }
    );
  };

}]);
