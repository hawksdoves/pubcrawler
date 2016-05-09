pubcrawlerApp.controller('RoundsController', ['$state','RoundService', 'CrawlService', function($state, RoundService, CrawlService) {

  var self = this;

  self.roundId = $state.params.id

  self.updateRound = function(roundId){
    console.log(self.roundId);
    RoundService.updateRound(roundId);
    $state.go('app.roundSingle');
  };

  CrawlService.getSingleCrawl($state.params.crawl_id)
    .then(function(data) {
      self.singleCrawl = data;
    });

  self.isCheckedIn = function(roundId) {
    var checkedIn;
    self.singleCrawl.rounds.forEach(_RoundMatcher);
    return checkedIn;

    function _RoundMatcher() {
      if(round.id === self.roundId ) {
        checkedIn = round.checkin;
      }
    }
  };


}]);
