pubcrawlerApp.controller('RoundsController', ['$state', '$window', 'RoundService', 'CrawlService', function($state, $window, RoundService, CrawlService) {

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

  self.pubDetails = function() {
    return self.singleCrawlData.pubs.filter(findPub)[0];

    function findPub(pub) {
      return pub.id == self.roundDetails.pub_id;
    }
  };

  self.challengeDetails = function() {
    return self.singleCrawlData.challenges.filter(findChallenge)[0];

    function findChallenge(challenge) {
        return challenge.id == self.roundDetails.challenge_id;
    }
  };

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(saveAllCrawlData)
      .then(roundInfo);

  function saveAllCrawlData(data) {
    self.singleCrawlData = data;
    return self.singleCrawlData;
  }

  function roundInfo(data) {
    self.roundDetails  = data.rounds.filter(findRound)[0];

    function findRound(round) {
      return round.id == self.roundId;
    }
  }


}]);
