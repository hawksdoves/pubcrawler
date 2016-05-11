pubcrawlerApp.controller('AuthController', ['$window', '$state', '$auth', function($window, $state, $auth) {
  var self  = this;

  self.submitRegistration = function(registrationForm) {
    $auth.submitRegistration(registrationForm)
      .then(function(resp) {
        // $window.location.reload(true);
        $state.go('app.crawls');
      })
      .catch(function(resp) {
        console.warn(resp);
      });
  };

  self.submitLogin = function(loginForm) {
    $auth.submitLogin(loginForm)
      .then(function(resp) {
        $state.go('app.crawls');
        // $window.location.reload(true);
      })
      .catch(function(resp) {
        console.warn(resp);
      });
  };

  self.signOut = function() {
      $auth.signOut()
        .then(function(resp) {
        })
        .catch(function(resp) {
          console.warn(resp);
        });
    };
}]);
