@app.controller 'CommentsController', ['$scope', '$http', '$location', '$timeout', ($scope, $http, $location, $timeout)->
  url = $location.absUrl() + "/comments.json"

  $http.get(url).success (data)->
    console.log data
    $scope.comments = data

  $scope.publish_success = null

  $scope.submit = ->
    $scope.submitting = true
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
      $scope.publish_fail_msg = '网络错误, 请重试, 错误码为: ' + status
    .finally ->
      $scope.submitting = false
      $scope.timeout = $timeout ->
        $timeout.cancel($scope.timeout)
        $scope.publish_success = null
      , 5*1000
]
