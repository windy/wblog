$(document).on 'turbolinks:load', ->
  if $('#image-tag').length > 0
    new QRCode( $('#image-tag')[0], $('#image-tag').data('url') )
  $('#qrcode-link').click (event)->
    event.preventDefault()
    $('.social-share').toggle()
