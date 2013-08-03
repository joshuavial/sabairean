'use strict'

# Declare app level module which depends on filters, and services
@angular.module('hlApp', ['hlApp.filters', 'hlApp.services', 'hlApp.directives', 'localization']).
    config ['$routeProvider', ($routeProvider) ->
        $routeProvider.
            when('/topics', {templateUrl: 'partials/topics.html', controller: TopicController}).
            when('/topics/:topic_key', {templateUrl: 'partials/chapters.html', controller: ChapterController}).
            when('/topics/:topic_key/chapters/:chapter_key', {templateUrl: 'partials/chapter.html', controller: StepController}).
            when('/topics/:topic_key/chapters/:chapter_key/:step', {templateUrl: 'partials/chapter.html', controller: StepController}).
            otherwise({redirectTo: '/topics'})
        return
    ]
