pubcrawlerApp.controller('RoundsController', ['$state', '$window', 'RoundService', 'CrawlService', function($state, $window, RoundService, CrawlService) {

  var self = this;

  self.roundId = $state.params.id;

  self.updateRound = function(roundId) {
    RoundService.updateRound(roundId)
      .then(function(){
          $window.location.reload(true);
      });
  };

  self.pubDetails = function(){
    console.log(self.singleCrawlData);
    return self.singleCrawlData.pubs.filter(findPub)[0];

    function findPub(pub) {
      return pub.id == self.roundDetails.pub_id;
    }
  };

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(saveAllCrawlData)
      .then(roundInfo);

  function saveAllCrawlData(data){
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
