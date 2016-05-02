# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).on 'turbolinks:load', ->
  $('a#upload_photo').click ->
    $('input[type=file]').show().focus().click().hide()
    false

  $('#tabs').on 'change.zf.tabs', ()->
    if $('#preview:visible').length > 0
      $('#preview').text('Loading...')
      $.ajax
        url: '/admin/posts/preview'
        type: 'POST'
        data:
          content: $('#content-input').val()
        success: (data)->
          $('#preview').html(data)

  $('a.tag').click (event)->
    event.preventDefault()
    new_labels = $(this).text()
    if $('#labels').val() == ''
      labels = new_labels
    else
      labels = $('#labels').val() + ", #{new_labels}"
    $('#labels').val(labels)

  opt =
    type: 'POST'
    url: "/photos"
    success: (data,status,xhr)->
      txtBox = $("#content-input")
      caret_pos = txtBox.caret('pos')
      src_merged = "\n" + data + "\n"
      source = txtBox.val()
      before_text = source.slice(0, caret_pos)
      txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
      txtBox.caret('pos',caret_pos + src_merged.length)
      txtBox.focus()

  $('input[type=file]').fileUpload opt
