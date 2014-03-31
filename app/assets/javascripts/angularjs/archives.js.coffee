@app.controller 'ArchivesController', ($scope, $http, $location, $timeout)->
  url = "/archives.json"
  $http.get(url).success (res)->
    $scope.start_with = res.start_with
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
    ).success (res)->
      $scope.no_more_flag = true if res.posts.length == 0
      $scope.start_with = res.start_with
      $scope.posts = $scope.posts.concat(res.posts)
      $timeout ->
        $scope.loading_flag = false
      , 500
      $timeout ->
        $scope.no_more_flag = false
      , 3000

  $scope.visit = (id)->
    window.location.href = ("/blogs/" + id)
