@app.controller 'AdminPostsController', ($scope, $http, $location, $timeout, $cookies, $sce)->

  $scope.body_active = true

  $scope.changeToBody = ->
    $scope.body_active = true

  $scope.changeToPreview = ->
    $scope.body_active = false
    $scope.previewHTML = '加载中...'
    $http.post '/admin/posts/preview', { content: $scope.content }
    .success (res)->
      $scope.previewHTML = res
