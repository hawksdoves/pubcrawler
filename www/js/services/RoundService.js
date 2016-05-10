pubcrawlerApp.service('RoundService', ['$http', function($http) {
  var self = this;

  self.updateRound = function(roundId) {
    return $http.patch($apiUrl + '/rounds/' + roundId)
    .success(function(data) {
      return data;
    });
  };

}]);
