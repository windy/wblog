@app.controller 'AboutScrollController', [ '$scope', '$document', ($scope, $document)->

  about_id = angular.element(document.getElementById('about'))

  $document.on 'scroll', ()=>
    $scope.$apply()

  $scope.is_top = ()->
    $document.scrollTop() <= 0

  
  $scope.to_about = ()->
    $document.scrollToElementAnimated(about_id)
]
