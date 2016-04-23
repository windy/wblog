$(document).on 'turbolinks:load', ->
  $('#alert-container .close-button').click ()->
    $('#alert-container').hide()
