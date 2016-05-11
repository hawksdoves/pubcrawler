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

  self.updateNextRound = function(crawlId){
    RoundService.revealNextRound(crawlId)
      .then(function(){
        $window.location.reload(true);
        $state.go('app.crawlSingle', { id: self.crawlId });
      });
    // notVisibleRounds = self.allRoundsOfCrawl.filter(!isVisible);
    // notVisibleRounds[0].visible = true
  };

  function isVisible(round){
    return round.visible===true;
  }

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(roundInfo);

  function roundInfo(data) {
    self.allRoundsOfCrawl = data.rounds;
    self.roundDetails  = data.rounds.filter(findRound)[0];

    function findRound(round) {
      return round.id == self.roundId;
    }
  }

  self.showMap = function() {
    DirectionsService.showMap(self.roundDetails.pubDetails, $scope);
  };
}]);
