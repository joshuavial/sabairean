'use strict'

@AppController = ($scope, localize) ->
  $scope.setLanguage = (language) ->
    localize.setLanguage(language)


@ChapterCtrl = ($scope, $http) ->
  $http.get('chapters/chapters.json').success (data) ->
    $scope.chapters = data
