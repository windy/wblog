@app.controller 'LikesController', ['$scope', '$http', '$location', '$cookies', ($scope, $http, $location, $cookies)->
  url = window.location.pathname + "/likes"

  $http.get url
  .success (res)->
    $scope.count = res.count

  $scope.like = $cookies.like

  if $scope.like
    $http
      url: window.location.pathname + "/likes/#{$scope.like}/is_liked"
      method: 'GET'
    .success (res)->
      if  res == true
        $scope.is_liked = true
      else
        $scope.is_liked = false
  else
    $scope.is_liked = false

  $scope.submit = ->
    $http.post url
    .success (res)->
      if res.success
        $scope.like = $cookies.like = res.id
        $scope.count = res.count
        $scope.is_liked = true

  $scope.cancel = ->
    $http.delete url + "/" + $scope.like
    .success (res)->
      $scope.count = res.count
    $scope.is_liked = false
    # anyway, clear cookie
    delete $cookies["like"]
    $scope.like = null
]
