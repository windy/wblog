$(document).on('turbo:load', function(){
  $('a#upload_photo').click(function(){
    $('input[type=file]').show().focus().click().hide()
    return false
  })

  var opt = {
    type: 'POST',
    url: "/photos",
    success: function(data,status,xhr){
      txtBox = $("#content-input")
      caret_pos = txtBox.caret('pos')
      src_merged = "\n" + data + "\n"
      source = txtBox.val()
      before_text = source.slice(0, caret_pos)
      txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
      txtBox.caret('pos',caret_pos + src_merged.length)
      txtBox.focus()
    }
  }

  $('input[type=file]').fileUpload(opt)

  $('#preview-link').on('show.bs.tab', function(e){
    $('#preview').text('Loading...')
    $.ajax({
      url: '/admin/posts/preview',
      type: 'POST',
      data: { content: $('#content-input').val() },
      success: function(data){
        $('#preview').html(data)
      }
    })
  })
})
