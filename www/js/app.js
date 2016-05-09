var pubcrawlerApp = angular.module('pubcrawlerApp', ['ionic'])

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

  .state('app.roundSingle', {
    url: '/rounds/:id',
    views: {
      'menuContent': {
        templateUrl: 'templates/rounds/single.html',
        controller: 'RoundsController as ctrl'
      }
    }
  });

  $urlRouterProvider.otherwise('/app/crawls');
});
