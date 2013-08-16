'use strict'

# Declare app level module which depends on filters, and services
@angular.module('sabairean', ['localization']).
    config ['$routeProvider', ($routeProvider) ->
        $routeProvider.
            when('/courses', {templateUrl: '/assets/templates/courses/index.html', controller: 'coursesCtrl'}).
            when('/courses/:id', {templateUrl: '/assets/templates/courses/show.html', controller: 'coursesCtrl'}).
            otherwise({redirectTo: '/courses'})
        return
    ]
