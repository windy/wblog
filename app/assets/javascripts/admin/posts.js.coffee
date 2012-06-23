# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).ready ->
  
  preview = $('.preview')
  content = $('#post_content')

  $('#content').click ->
    preview.hide()
    content.show()
    $(this).addClass('active')
    $('#preview').removeClass('active')

  $('#preview').click ->
    content.hide()
    $(this).addClass('active')
    $('#content').removeClass('active')
    preview.html('Loading...')
    preview.show()
    $.post $(this).attr('url'), text: content.val(), (data)->
      preview.html(data)
    
