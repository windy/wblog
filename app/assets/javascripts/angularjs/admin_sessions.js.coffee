@app.controller 'AdminSessionsController', [ '$scope', '$http', '$timeout', '$cookies', ($scope, $http, $timeout, $cookies)->
  url = '/admin/sessions'

  $scope.login = ->
    $http
      url: url
      method: 'POST'
      data:
        username: $scope.username
        password: $scope.password
    .success (res)->
      if res.success
        urlback = $cookies.urlback || 'admin'
        window.location = urlback
      else
        $scope.password = ''
        $scope.error_msg = res.message
      $timeout ->
        $scope.error_msg = null
      , 5000
]
