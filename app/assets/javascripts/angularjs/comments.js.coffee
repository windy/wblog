@app.controller 'CommentsController', ['$scope', '$http', '$location', '$timeout', '$cookies', ($scope, $http, $location, $timeout, $cookies)->
  url = window.location.pathname + "/comments.json"

  $scope.name = $cookies.name
  $scope.email = $cookies.email

  $http.get(url).success (data)->
    $scope.comments = data

  $scope.publish_success = null

  $scope.submit = ->
    $scope.submitting = true
    $cookies.name = $scope.name
    $cookies.email = $scope.email
    comment = { content: $scope.content, name: $scope.name, email: $scope.email }
    $http.post(url, comment)
    .success (res)->
      if res.success
        $scope.publish_success = true
        $scope.content = ''
        $scope.comments.unshift(res.data)
      else
        $scope.publish_success = false
        $scope.publish_fail_msg = res.message
    .error (data, status)->
      $scope.publish_success = false
      $scope.publish_fail_msg = 'Network Error, Retry for a moment, Status Code: ' + status
    .finally ->
      $scope.submitting = false
      $scope.timeout = $timeout ->
        $timeout.cancel($scope.timeout)
        $scope.publish_success = null
      , 5*1000
]
