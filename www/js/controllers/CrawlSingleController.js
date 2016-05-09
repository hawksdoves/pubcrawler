pubcrawlerApp.controller('CrawlSingleController', ['$state', 'CrawlService', function($state, CrawlService, $location) {

  var self = this;

  CrawlService.getSingleCrawl($state.params.id)
    .then(function(data) {
      self.singleCrawl = data;
    });

  self.pubName = function(round) {
    var pubName;
    self.singleCrawl.pubs.forEach(_pubRoundMatcher);
    return pubName;

    function _pubRoundMatcher(pub) {
      if(pub.id == round.pub_id) {
        pubName = pub.name;
      }
    }
  };
}]);
