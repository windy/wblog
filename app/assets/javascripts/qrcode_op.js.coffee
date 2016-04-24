$(document).on 'turbolinks:load', ->

  if $('#qrcode-home').length > 0
    $('#qrcode-home').empty()
    new QRCode( $('#qrcode-home')[0], $('#qrcode-home').data('url') )

  if $('#image-tag').length > 0
    $('#image-tag').empty()
    new QRCode( $('#image-tag')[0], $('#image-tag').data('url') )

  $('#qrcode-link').click (event)->
    event.preventDefault()
    $('.social-share').toggle()
