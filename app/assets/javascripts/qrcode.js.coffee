$(document).ready ()->
  $('#qrcode-link').click (event)->
    event.preventDefault()
    $('.social-share').toggle()
