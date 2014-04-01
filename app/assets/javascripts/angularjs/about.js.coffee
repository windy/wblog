@app.controller 'AboutController', ($scope)->
  $scope.type = null

  $scope.click = (v)->
    if $scope.type == v
      $scope.type = null
      return
    $scope.type = v
  $scope.weixin_click = ->
    $scope.weixin = !$scope.weixin
