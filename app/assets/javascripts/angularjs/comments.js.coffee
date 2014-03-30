@app.controller 'CommentsController', ($scope, $http, $location)->
  url = $location.absUrl() + "/comments"

  $http.get(url).success (data)->
    console.log data
    $scope.comments = data

  $scope.publish_success = null

  $scope.submit = ->
    comment = { content: $scope.content, name: $scope.name, email: $scope.email }
    $http.post(url, comment)
    .success (res)->
      if res.success
        $scope.publish_success = true
        $scope.content = ''
        $scope.comments.unshift(res.data)
      else
        $scope.publish_success = false
      $timeout ->
        $scope.publish_success = null
      , 3*1000
        
    .error (data)->
      alert(data)
