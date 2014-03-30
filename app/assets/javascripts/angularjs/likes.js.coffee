@app.controller 'LikesController', ($scope, $http, $location, $cookies)->
  url = $location.absUrl() + "/likes"

  $scope.count = 0

  $scope.get_count = ->
    $http.get url
    .success (res)->
      $scope.count = res.count

  $scope.get_count()
  
  $scope.like = $cookies.like

  $scope.submit = ->
    $http.post url
    .success (res)->
      if res.success
        $scope.count += 1
        $scope.like = $cookies.like = res.id

  $scope.cancel = ->
    $http.delete url + "/" + $scope.like
    # anyway, clear cookie
    delete $cookies["like"]
    $scope.like = null
    $scope.get_count()
