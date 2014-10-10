#= require angular
#= require angular-cookies
#= require angular-resource
#= require angular-sanitize
#= require angular-scroll
#= require_self
#= require_tree ./angularjs

@app = angular.module('app', ['ngCookies', 'ngSanitize', 'duScroll'])
@app.value('duScrollOffset', 30)

@app.config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    provider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
])
