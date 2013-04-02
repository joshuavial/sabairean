'use strict'

# Declare app level module which depends on filters, and services
@angular.module('hlApp', ['hlApp.filters', 'hlApp.services', 'hlApp.directives', 'localization']).
    config ['$routeProvider', ($routeProvider) ->
        $routeProvider.
            when('/chapters', {templateUrl: 'partials/chapters.html', controller: ChapterCtrl}).
            otherwise({redirectTo: '/chapters'})
        return
    ]
