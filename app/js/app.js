(function() {
  'use strict';  this.angular.module('hlApp', ['hlApp.filters', 'hlApp.services', 'hlApp.directives', 'localization']).config([
    '$routeProvider', function($routeProvider) {
      $routeProvider.when('/topics', {
        templateUrl: 'partials/topics.html',
        controller: TopicController
      }).when('/topics/:topic_key', {
        templateUrl: 'partials/chapters.html',
        controller: ChapterController
      }).when('/topics/:topic_key/chapters/:chapter_key', {
        templateUrl: 'partials/chapter.html',
        controller: ChapterDetailController
      }).when('/topics/:topic_key/chapters/:chapter_key/:step', {
        templateUrl: 'partials/chapter.html',
        controller: ChapterDetailController
      }).otherwise({
        redirectTo: '/topics'
      });
    }
  ]);

}).call(this);
