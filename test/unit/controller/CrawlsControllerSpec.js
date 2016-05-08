describe('CrawlsController', function() {
  beforeEach(module('pubcrawlerApp'));

  beforeEach(module(function($provide) {
    $provide.value('$ionicTemplateCache', function(){} );
  }));

  beforeEach(module(function($urlRouterProvider) {
    $urlRouterProvider.deferIntercept();
  }));

  var ctrl, scope, CrawlService, deferred;
  var CrawlData = [{id: 1, name: "crawl1", start_postcode: "n16bn"}, {id: 2, name: "crawl2", start_postcode: "n16bw"}];

  beforeEach(inject(function($rootScope, $controller, _CrawlService_, $q) {
      CrawlService = _CrawlService_;
      ctrl = $controller('CrawlsController',{$scope: scope, CrawlService: CrawlService});
      scope = $rootScope;
      deferred = $q.defer();
      spyOn(CrawlService, 'getCrawls').and.returnValue(deferred.promise);
    }));

    describe('State', function() {
        it('should expose crawls to the view', function() {
          expect(ctrl.crawls).toBeDefined();
          expect(angular.isArray(ctrl.crawls)).toBe(true);
        });
    });

    describe('Aynchronous calls', function() {
      it('should call getCrawls on CrawlService', function() {
        ctrl.getCrawls();
        expect(CrawlService.getCrawls).toHaveBeenCalled();
        expect(CrawlService.getCrawls.calls.count()).toBe(1);
      });

      it('should do set change property of crawls to contain new data on success', function() {
        ctrl.getCrawls();
        deferred.resolve(CrawlData);
        scope.$digest();
        expect(ctrl.crawls).toBe(CrawlData);
      });
    });
});
