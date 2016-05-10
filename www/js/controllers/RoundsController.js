pubcrawlerApp.controller('RoundsController', ['$state', '$window', 'RoundService', 'CrawlService', '$cordovaGeolocation', '$scope', function($state, $window, RoundService, CrawlService, $cordovaGeolocation, $scope) {

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

  var options = {timeout: 10000, enableHighAccuracy: false};

  self.showMap = function() {
    $cordovaGeolocation.getCurrentPosition(options).then(function(position){
      document.getElementById('map').style.minHeight = '400px';
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

        var directionsRenderer = new google.maps.DirectionsRenderer({ polylineOptions:{strokeColor:"#4a4a4a",strokeWeight:3}, suppressMarkers:true });
        var infowindow = new google.maps.InfoWindow({
          content: "You are here!"
        });

        google.maps.event.addListener(currentLocationMarker, 'click', function() {
            infowindow.open(currentLocationMarker.get('map'), currentLocationMarker);
          });
        directionsRenderer.setMap($scope.map);
        directionsRenderer.setPanel(document.getElementById('directionsPanel'));

        var directionsService = new google.maps.DirectionsService();
        var directionsRequest = {
          origin: latLng,
          destination: pubLatLng,
          travelMode: google.maps.DirectionsTravelMode.WALKING,
          unitSystem: google.maps.UnitSystem.METRIC
        };
        directionsService.route(directionsRequest, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
          directionsRenderer.setDirections(response);
          } else {
            alert('Error: ' + status);
          }
        });
      });
    }, function(error) {
    console.log("Could not get location");
    });
  };
}]);
