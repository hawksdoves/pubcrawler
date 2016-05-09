pubcrawlerApp.service('CrawlService', ['$http', function($http) {
  var self = this;

  self.createCrawl = function(crawlData) {
    return $http.post('http://localhost:3000/crawls', crawlData)
    .then(function(data) {
      console.log(data);
      return data;
    });
  };

  self.getCrawls = function() {
    return $http.get('http://localhost:3000/crawls')
    .then(function(response) {
      return response.data;
    });
  };
}]);
