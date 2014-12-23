@app.controller 'ArchivesController',[ '$scope', '$http', '$location', '$timeout', '$cookies', ($scope, $http, $location, $timeout, $cookies)->
  url = window.location.pathname + ".json"
  start_with = $cookies.start_with if window.location.pathname == $cookies.start_with_type
  $http
    url: url
    method: 'GET'
    params:
      start_with: start_with
      all: true
  .success (res)->
    $scope.update_start_with(res.start_with)
    $scope.posts = res.posts

  $scope.no_more_flag = false
  $scope.loading_flag = false

  $scope.load = ()->
    $scope.loading_flag = true
    $http(
      url: url
      method: 'GET'
      params:
        start_with: $scope.start_with
        type: $scope.type
    ).success (res)->
      $scope.no_more_flag = true if res.posts.length == 0
      $scope.update_start_with(res.start_with)
      $scope.posts = $scope.posts.concat(res.posts)
      $timeout ->
        $scope.loading_flag = false
      , 500
      $timeout ->
        $scope.no_more_flag = false
      , 3000

  $scope.visit = (id)->
    "/blogs/" + id

  $scope.update_start_with = (start_with)->
    $scope.start_with = start_with
    $cookies.start_with_type = window.location.pathname
    $cookies.start_with = start_with
]
