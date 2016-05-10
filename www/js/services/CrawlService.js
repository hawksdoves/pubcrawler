pubcrawlerApp.service('CrawlService', ['$http', function($http) {
  var self = this;

  self.createCrawl = function(crawlData) {
    return $http.post($apiUrl + '/crawls', crawlData)
    .success(function(data) {
      return data.message;
    });
  };

  self.getCrawls = function() {
    return $http.get($apiUrl + '/crawls')
    .then(function(response) {
      return response.data;
    });
  };

  self.getSingleCrawl = function(crawlId) {
    return $http.get($apiUrl + '/crawls/' + crawlId)
    .then(function(response) {
      return response.data;
    });
  };
}]);
