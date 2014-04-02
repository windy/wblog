@app.controller 'AboutController', [ '$scope', '$timeout', '$http', ($scope, $timeout, $http)->
  $scope.type = null

  $scope.click = (v)->
    if $scope.type == v
      $scope.type = null
      return
    $scope.type = v
  $scope.weixin_click = ->
    $scope.weixin = !$scope.weixin

  #订阅功能

  $scope.email = ''
  $scope.subscribe_success = null
  
  $scope.email_validate = ->
    $scope.email.match(/@/)
  
  $scope.subscribe = ()->
    $http
      url: '/subscribes'
      method: 'POST'
      params:
        email: $scope.email
    .success (res)->
      if res.success
        $scope.email = ''
        $scope.subscribe_success = true
      else
        $scope.subscribe_success = false
        $scope.subscribe_fail_msg = res.message
    $timeout ->
      $scope.subscribe_success = null
    , 3000
]
