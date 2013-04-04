(function() {
  'use strict';  this.AppController = function($scope, localize) {
    return $scope.setLanguage = function(language) {
      return localize.setLanguage(language);
    };
  };

  this.ChapterController = function($scope, $http) {
    return $http.get('chapters/chapters.json').success(function(data) {
      return $scope.chapters = data;
    });
  };

  this.ChapterDetailController = function($scope, $http, $routeParams, localize) {
    var set_step_path;

    $scope.chapter_key = $routeParams.chapter_key;
    $scope.path = "chapters/" + $scope.chapter_key;
    set_step_path = function() {
      $scope.step_path = "" + $scope.path + "/" + $scope.step;
      localize.additional_paths = ["chapters/" + $scope.chapter_key + "/i18n"];
      return localize.initAllLocalizedResources();
    };
    $scope.test = "{{$scope.chapter_key}}";
    $scope.step = $routeParams.step;
    set_step_path();
    $http.get("chapters/" + $scope.chapter_key + "/config.js").success(function(data) {
      $scope.config = data;
      if (typeof $scope.step === 'undefined') {
        $scope.step = data.steps[0];
      }
      return set_step_path();
    });
    return $scope.scope_image = function(image) {
      return "" + $scope.path + "/images/" + image;
    };
  };

}).call(this);
