pubcrawlerApp.service('DirectionsService', ['$http', '$cordovaGeolocation', function($http, $cordovaGeolocation) {

  var self = this;

  self.showMap = function(pub, scope) {

    var options = {timeout: 10000, enableHighAccuracy: false};

    $cordovaGeolocation.getCurrentPosition(options).then(function(position) {
      document.getElementById('map').style.minHeight = '400px';
      var latLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      var pubLatLng = new google.maps.LatLng(pub.latitude, pub.longitude);

      var mapOptions = {
        center: pubLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      scope.map = new google.maps.Map(document.getElementById("map"), mapOptions);

      google.maps.event.addListenerOnce(scope.map, 'idle', function() {
        var pubMarker = new google.maps.Marker({
            map: scope.map,
            animation: google.maps.Animation.DROP,
            position: pubLatLng,
            icon: 'img/beer.png'
        });

        var currentLocationMarker = new google.maps.Marker({
            map: scope.map,
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
        directionsRenderer.setMap(scope.map);
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
