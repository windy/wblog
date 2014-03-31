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

  $scope.addTag = (e)->
    new_labels= $(e.target).text()
    if $scope.labels
      $scope.labels += ", #{new_labels}"
    else
      $scope.labels = new_labels
