# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).ready ->
  $('a#upload_photo').click ->
    $('input[type=file]').show().focus().click().hide()
    false
  
  opt =
    type: 'POST'
    url: "/photos"
    success: (data,status,xhr)->
      insertAtCaret('post_content', data)
  

  $('input[type=file]').fileUpload opt
