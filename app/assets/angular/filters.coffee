'use strict'

# Filters

@angular.module('hlApp.filters', []).
	filter('interpolate', ['version', (version) ->
		return (text) ->
			String(text).replace(/\%VERSION\%/mg, version)

	])


# 'use strict';

# /* Filters */

# angular.module('hlApp.filters', []).
#   filter('interpolate', ['version', function(version) {
#     return function(text) {
#       return String(text).replace(/\%VERSION\%/mg, version);
#     }
#   }]);
