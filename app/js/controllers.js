(function() {
  'use strict';  this.ChapterCtrl = function($scope, $http) {
    return $http.getJSON('chapters/chapters.json').success(function(data) {
      return $scope.chapters = data;
    });
  };

}).call(this);
