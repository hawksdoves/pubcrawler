pubcrawlerApp.controller('RoundsController', ['$state', '$window', 'RoundService', 'CrawlService', 'DirectionsService', '$cordovaGeolocation', '$scope', function($state, $window, RoundService, CrawlService, DirectionsService, $cordovaGeolocation, $scope) {

  var self = this;

  self.roundId = $state.params.id;
  self.crawlId = $state.params.crawl_id;

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(roundInfo);

  function roundInfo(data) {
    self.allRoundsOfCrawl = data.rounds;
    self.roundDetails  = data.rounds.filter(findRound)[0];

    function findRound(round) {
      return round.id == self.roundId;
    }
  }

  self.updateRound = function(roundId) {
    RoundService.updateRound(roundId)
      .then(function(){
          $window.location.reload(true);
          $state.go('app.crawlSingle', { id: self.crawlId });
      });
  };

  self.updateNextRound = function(){
    nextRound = nextRoundToReveal();
    RoundService.updateRound(nextRound)
      .then(function(){
        $window.location.reload(true);
        $state.go('app.crawlSingle', { id: self.crawlId });
      });

  };

  function nextRoundToReveal() {
    notVisibleRounds = self.allRoundsOfCrawl.filter(isNotVisible);
    notVisibleRounds[0].visible = true;
    return notVisibleRounds[0].id;
  }

  function isNotVisible(round) {
    return round.visible===false;
  }

  function isVisible(round) {
    return round.visible===true;
  }

  
  self.isNotCurrentOrLastRound = function(round) {
    return isNotCurrentRound(round) || isLastRound(round)
  } 

  function isNotCurrentRound(round) {
    return allVisibleRounds().pop() !== round;
  }


  function isLastRound(round) {
    return self.allRoundsOfCrawl.length === allVisibleRounds().length;
  }

  function allVisibleRounds() {
    return self.allRoundsOfCrawl.filter(isVisible)
  }

  self.showMap = function() {
    DirectionsService.showMap(self.roundDetails.pubDetails, $scope);
  };
}]);
