pubcrawlerApp.controller('CrawlsController', ['$scope','CrawlService', function($scope, CrawlService) {

  var self = this;

  self.crawls = [{name: "haha"}];

  self.getCrawls = function(){
    CrawlService.getCrawls().then(
      function(data){
        self.crawls = data;
      });
  };
}]);
