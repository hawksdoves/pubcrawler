pubcrawlerApp.controller('TimerController', ['$timeout', function($timeout) {
  var self = this;

  self.counter = 10;
  var mytimeout = null; // the current timeoutID
  //
  self.onTimeout = function() {
      if(self.counter ===  0) {
          // self.$broadcast('timer-stopped', 0);
          $timeout.cancel(mytimeout);
          return;
      }
      self.counter--;
      mytimeout = $timeout(self.onTimeout, 1000);
  };
  //
  self.startTimer = function() {
      mytimeout = $timeout(self.onTimeout, 1000);
  };

  //
  // self.stopTimer = function() {
  //     self.$broadcast('timer-stopped', self.counter);
  //     self.counter = 90;
  //     $timeout.cancel(mytimeout);
  // };



  // triggered, when the timer stops, you can do something here, maybe show a visual indicator or vibrate the device
  // self.$on('timer-stopped', function(event, remaining) {
  //     if(remaining === 0) {
  //         console.log('your time ran out!');
  //     }
  // });
}]);
