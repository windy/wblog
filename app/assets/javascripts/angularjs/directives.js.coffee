@app.directive 'ngInitial', ->
    restrict: 'A',
    controller: [
      '$scope', '$element', '$attrs', '$parse', ($scope, $element, $attrs, $parse)->
        val = $attrs.ngInitial || $attrs.value || $attrs.$$element.text()
        getter = $parse($attrs.ngModel)
        setter = getter.assign
        setter($scope, val)
    ]
