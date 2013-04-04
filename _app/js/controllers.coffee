'use strict'

@AppController = ($scope, $http, localize, $routeParams) ->
  $scope.setLanguage = (language) ->
    localize.setLanguage(language)

  $http.get('chapters/config.json').success (data) ->
    $scope.topics = data.topics

  $scope.get_topic = ($routeParams) ->
    for topic in $scope.topics
      $scope.topic = topic if topic.key = $routeParams.topic_key
      $scope.chapters = $scope.topic.chapters

  $scope.topic_exists = () ->
    return false unless angular.isDefined($routeParams.topic_key)
    angular.isDefined($scope.topic)

  $scope.get_chapter = ($routeParams) ->
    $scope.get_topic($routeParams)
    for chapter in $scope.chapters
      $scope.chapter = chapter if chapter.key == $routeParams.chapter_key

  $scope.chapter_exists = () ->
    return false unless angular.isDefined($routeParams.chapter_key)
    angular.isDefined($scope.chapter)

@ChapterController = ($scope, $routeParams) ->
  $scope.get_topic($routeParams)
  $scope.chapters = $scope.topic.chapters
  console.log($scope.topic)
  console.log($scope.chapters)

@TopicController = ($scope,$routeParams) ->

@ChapterDetailController = ($scope, $http, $routeParams, localize) ->
  $scope.get_chapter($routeParams)
  console.log($scope.chapter)
  $scope.path = "chapters/#{$scope.chapter.key}"

  set_step_path = () ->
    $scope.step_path = "#{$scope.path}/#{$scope.step}"
    localize.additional_paths = ["chapters/#{$scope.chapter.key}/i18n"]
    localize.initAllLocalizedResources()

  $scope.step = $routeParams.step
  set_step_path()

  $http.get("chapters/#{$scope.chapter.key}/config.js").success (data) ->
    $scope.config = data
    $scope.step = data.steps[0] if typeof($scope.step) == 'undefined'
    set_step_path()

  $scope.scope_image = (image) ->
    "#{$scope.path}/images/#{image}"


