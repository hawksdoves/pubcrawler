pubcrawlerApp.controller('RoundsController', ['$state', '$window', 'RoundService', 'CrawlService', 'DirectionsService', '$cordovaGeolocation', '$scope', function($state, $window, RoundService, CrawlService, DirectionsService, $cordovaGeolocation, $scope) {

  var self = this;

  self.roundId = $state.params.id;
  self.crawlId = $state.params.crawl_id;

  self.updateRound = function(roundId) {
    RoundService.updateRound(roundId)
      .then(function(){
          $window.location.reload(true);
          $state.go('app.crawlSingle', { id: self.crawlId });
      });
  };

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(roundInfo);

  function roundInfo(data) {
    self.roundDetails  = data.rounds.filter(findRound)[0];

    function findRound(round) {
      return round.id == self.roundId;
    }
  }

  self.showMap = function() {
    DirectionsService.showMap(self.roundDetails.pubDetails, $scope);
  };
}]);
