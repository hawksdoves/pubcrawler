pubcrawlerApp.service('RoundService', ['$http', function($http) {
  var self = this;

  self.updateRound = function(roundId) {
    return $http.patch($apiUrl + '/rounds/' + roundId)
    .success(function(data) {
      return data;
    });
  };

  self.revealNextRound = function(crawlId){
    return $http.patch($apiUrl + '/crawls/' + crawlId)
    .success(function(data) {
      return data;
    });
  };

}]);
