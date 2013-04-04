(function() {
  'use strict';  this.AppController = function($scope, $http, localize, $routeParams) {
    $scope.setLanguage = function(language) {
      return localize.setLanguage(language);
    };
    $http.get('chapters/config.json').success(function(data) {
      return $scope.topics = data.topics;
    });
    $scope.get_topic = function($routeParams) {
      var topic, _i, _len, _ref, _results;

      _ref = $scope.topics;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        topic = _ref[_i];
        if (topic.key = $routeParams.topic_key) {
          $scope.topic = topic;
        }
        _results.push($scope.chapters = $scope.topic.chapters);
      }
      return _results;
    };
    $scope.topic_exists = function() {
      if (!angular.isDefined($routeParams.topic_key)) {
        return false;
      }
      return angular.isDefined($scope.topic);
    };
    $scope.get_chapter = function($routeParams) {
      var chapter, _i, _len, _ref, _results;

      $scope.get_topic($routeParams);
      _ref = $scope.chapters;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        chapter = _ref[_i];
        if (chapter.key === $routeParams.chapter_key) {
          _results.push($scope.chapter = chapter);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };
    return $scope.chapter_exists = function() {
      if (!angular.isDefined($routeParams.chapter_key)) {
        return false;
      }
      return angular.isDefined($scope.chapter);
    };
  };

  this.ChapterController = function($scope, $routeParams) {
    $scope.get_topic($routeParams);
    $scope.chapters = $scope.topic.chapters;
    console.log($scope.topic);
    return console.log($scope.chapters);
  };

  this.TopicController = function($scope, $routeParams) {};

  this.ChapterDetailController = function($scope, $http, $routeParams, localize) {
    var set_step_path;

    $scope.get_chapter($routeParams);
    console.log($scope.chapter);
    $scope.path = "chapters/" + $scope.chapter.key;
    set_step_path = function() {
      $scope.step_path = "" + $scope.path + "/" + $scope.step;
      localize.additional_paths = ["chapters/" + $scope.chapter.key + "/i18n"];
      return localize.initAllLocalizedResources();
    };
    $scope.step = $routeParams.step;
    set_step_path();
    $http.get("chapters/" + $scope.chapter.key + "/config.js").success(function(data) {
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
