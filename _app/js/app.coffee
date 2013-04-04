'use strict'

# Declare app level module which depends on filters, and services
@angular.module('hlApp', ['hlApp.filters', 'hlApp.services', 'hlApp.directives', 'localization']).
    config ['$routeProvider', ($routeProvider) ->
        $routeProvider.
            when('/chapters', {templateUrl: 'partials/chapters.html', controller: ChapterController}).
            when('/chapters/:chapter_key', {templateUrl: 'partials/chapter.html', controller: ChapterDetailController}).
            when('/chapters/:chapter_key/:step', {templateUrl: 'partials/chapter.html', controller: ChapterDetailController}).
            otherwise({redirectTo: '/chapters'})
        return
    ]
