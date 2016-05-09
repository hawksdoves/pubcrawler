pubcrawlerApp.controller('RoundsController', ['$state','RoundService', 'CrawlService', function($state, RoundService, CrawlService) {

  var self = this;

  self.roundId = $state.params.id

  self.updateRound = function(roundId){
    RoundService.updateRound(roundId);
    $state.go('app.roundSingle');
  };

  // CrawlService.getSingleCrawl($state.params.crawl_id)
  //   .then(function(data) {
  //     self.singleCrawl = data;
  //   });

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(roundInfo);

  function roundInfo(data){
    var myround = data.rounds.filter(findRound)[0];
    return self.myround = myround;

    function findRound(round) {
      return round.id == self.roundId;
    }
  }

  // self.isCheckedIn = function() {
  //   var checkedIn;
  //   console.log("********");
  //   self.singleCrawl.rounds.forEach(_pubRoundMatcher);
  //   return checkedIn;
  //
  //   function _pubRoundMatcher(round) {
  //     if(round.id === self.roundId ) {
  //       checkedIn = round.checkin;
  //     }
  //   }
  // };


}]);
