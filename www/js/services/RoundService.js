pubcrawlerApp.service('RoundService', ['$http', function($http) {
  var self = this;

  self.updateRound = function(roundId) {
    return $http.patch('http://localhost:3000/rounds/' + roundId)
    .success(function(data) {
      return data;
    });
  };

}]);
