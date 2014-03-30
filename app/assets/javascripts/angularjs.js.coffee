#= require angular
#= require angular-cookies
#= require angular-resource
#= require_self
#= require_tree ./angularjs

@app = angular.module('app', ['ngCookies'])

@app.config(["$httpProvider", (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
