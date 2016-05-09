describe('RoundsController', function() {
  beforeEach(module('pubcrawlerApp'));

  beforeEach(module(function($provide) {
    $provide.value('$ionicTemplateCache', function(){} );
  }));

  beforeEach(module(function($urlRouterProvider) {
    $urlRouterProvider.deferIntercept();
  }));

  var ctrl, scope, RoundService, deferred;
  var roundData = { id: 1 };

  beforeEach(inject(function($rootScope, $controller, _RoundService_, $q) {
      RoundService = _RoundService_;
      ctrl = $controller('RoundsController',{$scope: scope, RoundService: RoundService});
      scope = $rootScope;
      deferred = $q.defer();
      spyOn(RoundService, 'updateRound');
    }));

    describe('State', function() {
        xit('should expose a round to the view', function() {
          expect(ctrl.rounds).toBeDefined();
          expect(angular.isArray(ctrl.rounds)).toBe(true);
        });
    });

    describe('Interaction with round service', function() {
      xit('should call on the updateRound', function() {
        ctrl.updateRound(roundData);
        expect(RoundService.updateRound(roundData)).toHaveBeenCalled();
      });
    });


});
