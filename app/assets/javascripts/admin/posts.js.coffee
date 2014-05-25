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
      txtBox = $("#post_content")
      caret_pos = txtBox.caret('pos')
      src_merged = "\n" + data + "\n"
      source = txtBox.val()
      before_text = source.slice(0, caret_pos)
      txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
      txtBox.caret('pos',caret_pos + src_merged.length)
      txtBox.scope().content = txtBox.val()
      txtBox.focus()
  

  $('input[type=file]').fileUpload opt
