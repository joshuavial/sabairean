'use strict'

@AppController = ($scope, localize) ->
  $scope.setLanguage = (language) ->
    localize.setLanguage(language)


@ChapterController = ($scope, $http) ->
  $http.get('chapters/chapters.json').success (data) ->
    $scope.chapters = data

@ChapterDetailController = ($scope, $http, $routeParams, localize) ->

  $scope.chapter_key = $routeParams.chapter_key
  $scope.path = "chapters/#{$scope.chapter_key}"

  set_step_path = () ->
    $scope.step_path = "#{$scope.path}/#{$scope.step}"
    localize.additional_paths = ["chapters/#{$scope.chapter_key}/i18n"]
    localize.initAllLocalizedResources()

  $scope.test = "{{$scope.chapter_key}}"
  $scope.step = $routeParams.step
  set_step_path()

  $http.get("chapters/#{$scope.chapter_key}/config.js").success (data) ->
    $scope.config = data
    $scope.step = data.steps[0] if typeof($scope.step) == 'undefined'
    set_step_path()

  $scope.scope_image = (image) ->
    "#{$scope.path}/images/#{image}"


