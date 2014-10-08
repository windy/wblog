@app.controller 'AboutScrollController', [ '$scope', '$document', ($scope, $document)->
  about_id = angular.element(document.getElementById('about'))
  
  $scope.to_about = ()->
    $document.scrollToElementAnimated(about_id)
]
