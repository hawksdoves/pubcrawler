pubcrawlerApp.service('CrawlService', ['$http', function($http) {
  var self = this;

  self.createCrawl = function(crawlData) {
    return $http.post($apiUrl + '/crawls', crawlData)
    .then(function(response) {
      return response.data.message;
    });
  };

  self.getCrawls = function() {
    return $http.get($apiUrl + '/crawls')
    .then(function(response) {
      return response.data;
    });
  };

  self.getSingleCrawl = function(crawlId) {
    return $http.get($apiUrl + '/crawls/' + crawlId)
    .then(function(response) {
      response.data.rounds.map(getPubDetails)
                            .map(getChallengeDetails);

      return response.data;

      function getPubDetails(round){
        round.pubDetails = response.data.pubs.filter(findPub)[0];
        return round;

        function findPub(pub) {
          return pub.id == round.pub_id;
        }
      }

      function getChallengeDetails(round) {
        round.challengeDetails = response.data.challenges.filter(findChallenge)[0];
        return round;

        function findChallenge(challenge) {
            return challenge.id == round.challenge_id;
        }
      }

    });
  };
}]);
