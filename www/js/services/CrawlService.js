pubcrawlerApp.service('CrawlService', ['$http', function($http) {
  var self = this;

  self.createCrawl = function(crawlData) {
    return $http.post('http://localhost:3000/crawls', crawlData)
    .success(function(data) {
      console.log('data.message');
      console.log(data.message);
      return data.message;
    });
  };

  self.getCrawls = function() {
    return $http.get('http://localhost:3000/crawls')
    .then(function(response) {
      return response.data;
    });
  };

  self.getSingleCrawl = function(crawlID) {
    return $http.get('http://localhost:3000/crawls/'+crawlID)
    .then(function(response) {
      return response.data;
    });
  };
}]);
