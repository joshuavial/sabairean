(function() {
  'use strict';  this.angular.module('hlApp', ['hlApp.filters', 'hlApp.services', 'hlApp.directives', 'localization']).config([
    '$routeProvider', function($routeProvider) {
      $routeProvider.when('/chapters', {
        templateUrl: 'partials/chapters.html',
        controller: ChapterCtrl
      }).otherwise({
        redirectTo: '/chapters'
      });
    }
  ]);

}).call(this);
