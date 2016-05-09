pubcrawlerApp.controller('CrawlSingleController', ['$state','CrawlService', function($state, CrawlService, $location) {

  var self = this;

  CrawlService.getSingleCrawl($state.params.id).then(
    function(data){
      console.log(data);
      self.singleCrawl = data;
  });

}]);
