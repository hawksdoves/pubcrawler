pubcrawlerApp.controller('RoundsController', ['$state','RoundService', function($state, RoundService) {

  var self = this;

  self.updateRound = function(updateData){
    RoundService.updateRound(updateData);
    $state.go('app.crawlSingle');
  };

}]);
