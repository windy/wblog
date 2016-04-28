$(document).on 'turbolinks:load', ->
  $('#alert-container .close-button').click ()->
    $('#alert-container').hide()

  if $('#blog-show-page').length > 0
    window.App.cable ||= ActionCable.createConsumer()
    if window.App.comment_channel
      window.App.comment_channel.unsubscribe()
    window.App.comment_channel = window.App.cable.subscriptions.create { channel: "CommentChannel", post_id: $('#blog-show-page').data('post_id') },
      received: (data)->
        if data['not'] != Cookies.get('cable_id')
          $.get( $('#blog-show-page').data('url') )
