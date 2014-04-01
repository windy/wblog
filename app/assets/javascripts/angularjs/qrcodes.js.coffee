@app.controller 'QRCodesController', ($scope)->
  $scope.show = ->
    $scope.qrcode = ! $scope.qrcode
