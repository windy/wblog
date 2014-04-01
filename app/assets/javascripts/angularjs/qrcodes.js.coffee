@app.controller 'QRCodesController', [ '$scope', ($scope)->
  $scope.show = ->
    $scope.qrcode = ! $scope.qrcode
]
