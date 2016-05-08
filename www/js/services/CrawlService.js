pubcrawlerApp.service('CrawlService', ['$http', function($http) {
  var self = this;

  self.addCrawl = function(crawlData) {
    return $http.post('http://localhost:3000/crawls/new', crawlData)
    .success(function(data) {
      return data;
    });
  };
}]);
