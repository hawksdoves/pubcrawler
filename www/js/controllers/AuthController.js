pubcrawlerApp.controller('AuthController', ['$state', '$auth', function($state, $auth) {
  var self  = this;

  self.submitRegistration = function(registrationForm) {
    $auth.submitRegistration(registrationForm)
      .then(function(resp) {
        console.log('then');
        console.log(resp.headers());
      })
      .catch(function(resp) {
        console.log('catch');
        console.log(resp);
      });
  };

  self.submitLogin = function(loginForm) {
    $auth.submitLogin(loginForm)
      .then(function(resp) {
        console.log('then');
        // console.log(resp.headers());
        console.log(resp);
      })
      .catch(function(resp) {
        console.log('catch');
        console.log(resp);
      });
  };


  self.signOut = function() {
      $auth.signOut()
        .then(function(resp) {
          console.log('then');
        })
        .catch(function(resp) {
          console.log('catch');
        });
    };

}]);
