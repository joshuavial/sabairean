'use strict'

# Directives

@angular.module('hlApp.directives', [])
	.directive('appVersion', ['version', (version) ->
		return (scope, elm, attrs) ->
			elm.text(version)
	])
