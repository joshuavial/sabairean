'use strict'

@ChapterCtrl = ($scope, $http) ->
  $http.getJSON('chapters/chapters.json').success (data) ->
    $scope.chapters = data
