$apiUrl = 'http://localhost:3000';

var pubcrawlerApp = angular.module('pubcrawlerApp', ['ionic','ngCordova', 'ng-token-auth'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
})

.config(function($authProvider) {

    // the following shows the default values. values passed to this method
    // will extend the defaults using angular.extend

    $authProvider.configure({
      apiUrl:                  $apiUrl,
      tokenValidationPath:     '/auth/validate_token',
      signOutUrl:              '/auth/sign_out',
      emailRegistrationPath:   '/auth',
      accountUpdatePath:       '/auth',
      accountDeletePath:       '/auth',
      confirmationSuccessUrl:  window.location.href,
      passwordResetPath:       '/auth/password',
      passwordUpdatePath:      '/auth/password',
      passwordResetSuccessUrl: window.location.href,
      emailSignInPath:         '/auth/sign_in',
      storage:                 'localStorage',
      forceValidateToken:      false,
      validateOnPageLoad:      true,
      proxyIf:                 function() { return false; },
      proxyUrl:                '/proxy',
      omniauthWindowType:      'sameWindow',
      authProviderPaths: {
        github:   '/auth/github',
        facebook: '/auth/facebook',
        google:   '/auth/google'
      },
      tokenFormat: {
        "access-token": "{{ token }}",
        "token-type":   "Bearer",
        "client":       "{{ clientId }}",
        "expiry":       "{{ expiry }}",
        "uid":          "{{ uid }}"
      },
      cookieOps: {
        path: "/",
        expires: 9999,
        expirationUnit: 'days',
        secure: false,
        domain: 'domain.com'
      },
      createPopup: function(url) {
        return window.open(url, '_blank', 'closebuttoncaption=Cancel');
      },
      parseExpiry: function(headers) {
        // convert from UTC ruby (seconds) to UTC js (milliseconds)
        return (parseInt(headers.expiry) * 1000) || null;
      },
      handleLoginResponse: function(response) {
        return response.data;
      },
      handleAccountUpdateResponse: function(response) {
        return response.data;
      },
      handleTokenValidationResponse: function(response) {
        return response.data;
      }
    });
  })



.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })

  .state('app.newCrawl', {
    url: '/crawls/new',
    views: {
      'menuContent': {
        templateUrl: 'templates/crawls/new.html',
        controller: 'CrawlsController as ctrl'
      }
    }
  })

  .state('app.crawlSingle', {
    url: '/crawls/:id',
    views: {
      'menuContent': {
        templateUrl: 'templates/crawls/single.html',
        controller: 'CrawlSingleController as ctrl',
        params: ['id']
      }
    }
  })

  .state('app.crawls', {
    url: '/crawls',
    views: {
      'menuContent': {
        templateUrl: 'templates/crawls/all.html',
        controller: 'CrawlsController as ctrl'
      }
    }
  })

  .state('app.signUp', {
    url: '/sign-up',
    views: {
      'menuContent': {
        templateUrl: 'templates/auth/sign-up.html',
        controller: 'AuthController as ctrl'
      }
    }
  })

  .state('app.login', {
    url: '/login',
    views: {
      'menuContent': {
        templateUrl: 'templates/auth/login.html',
        controller: 'AuthController as ctrl'
      }
    }
  })

  .state('app.roundSingle', {
    url: '/crawls/:crawl_id/rounds/:id',
    views: {
      'menuContent': {
        templateUrl: 'templates/rounds/single.html',
        controller: 'RoundsController as ctrl',
        params: ['crawl_id', 'id']
      }
    }
  });

  $urlRouterProvider.otherwise('/app/crawls');
});
