@app.controller 'SubscribesController', [ '$scope', '$http', ($scope, $http)->
  $scope.cancel = ()->
    $http
      url: '/subscribes/cancel'
      method: 'POST'
      params:
        email: $scope.email
    .success (res)->
      window.location = '/'
]
