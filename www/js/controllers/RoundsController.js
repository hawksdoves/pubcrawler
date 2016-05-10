pubcrawlerApp.controller('RoundsController', ['$state', '$window', 'RoundService', 'CrawlService', '$cordovaGeolocation', '$scope', function($state, $window, RoundService, CrawlService, $cordovaGeolocation, $scope) {

  var self = this;

  self.roundId = $state.params.id;

  self.updateRound = function(roundId) {
    RoundService.updateRound(roundId)
      .then(function(){
          $window.location.reload(true);
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

  var options = {timeout: 10000, enableHighAccuracy: false};

  self.showMap = function() {
    $cordovaGeolocation.getCurrentPosition(options).then(function(position){

      var latLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      var pubLatLng = new google.maps.LatLng(self.pubDetails().latitude, self.pubDetails().longitude);

      var mapOptions = {
        center: pubLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      $scope.map = new google.maps.Map(document.getElementById("map"), mapOptions);

      google.maps.event.addListenerOnce($scope.map, 'idle', function(){
        var pubMarker = new google.maps.Marker({
            map: $scope.map,
            animation: google.maps.Animation.DROP,
            position: pubLatLng,
            icon: 'img/beer.png'
        });

        var currentLocationMarker = new google.maps.Marker({
            map: $scope.map,
            animation: google.maps.Animation.DROP,
            position: latLng,
            icon: 'img/happy.png'
        });
      });

    }, function(error) {
    console.log("Could not get location");
    });
  };
}]);
