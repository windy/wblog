$(document).on 'turbolinks:load', ->
  $('#qrcode-link').click (event)->
    event.preventDefault()
    $('.social-share').toggle()
