(function() {
  'use strict';  this.AppController = function($scope, localize) {
    return $scope.setLanguage = function(language) {
      return localize.setLanguage(language);
    };
  };

  this.ChapterCtrl = function($scope, $http) {
    return $http.get('chapters/chapters.json').success(function(data) {
      return $scope.chapters = data;
    });
  };

}).call(this);
