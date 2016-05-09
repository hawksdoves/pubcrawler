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
      spyOn(CrawlService, 'createCrawl');
    }));

    describe('State', function() {
        it('should expose crawls to the view', function() {
          expect(ctrl.crawls).toBeDefined();
          expect(angular.isArray(ctrl.crawls)).toBe(true);
        });
    });

    describe('Interaction with crawl service', function() {

      it('should call getCrawls', function() {
        // ctrl.getCrawls();
        window.addEventListener('load', function() {
          expect(CrawlService.getCrawls).toHaveBeenCalled();
          expect(CrawlService.getCrawls.calls.count()).toBe(1);
          done();
        });
        
      });

      it('should do set change property of crawls to contain new data on success', function() {
        // ctrl.getCrawls();
        window.addEventListener('load', function() {
          deferred.resolve(CrawlData);
          scope.$digest();
          expect(ctrl.crawls).toBe(CrawlData);
          done();
        });
      });

      it('should call on the createCrawl', function() {
        ctrl.createCrawl(null);
        expect(CrawlService.createCrawl()).toHaveBeenCalled();
      });
    });


});
