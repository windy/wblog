@app.controller 'AdminSessionsController', ($scope, $http, $timeout)->
  url = '/admin/sessions'
  
  $scope.login = ->
    $http
      url: url
      method: 'POST'
      params:
        username: $scope.username
        password: $scope.password
    .success (res)->
      if res.success
        window.location = '/admin'
      else
        $scope.password = ''
        $scope.error_msg = res.message
      $timeout ->
        $scope.error_msg = null
      , 5000
