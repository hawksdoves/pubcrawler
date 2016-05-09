pubcrawlerApp.service('RoundService', ['$http', function($http) {
  var self = this;

  self.updateRound = function(updateData) {
    return $http.patch('http://localhost:3000/rounds/' + updateData.id)
    .success(function(data) {
      return data;
    });
  };
  
}]);
