$(document).on 'turbolinks:load', ->

  $('.like-button').click ->
    if $(this).hasClass('liked')
      $.ajax
        url: $(this).data('url') + '/' + Cookies.get('like')
        type: 'DELETE'
        success: (res)=>
          $(this).removeClass('liked')
          $(this).children('.count').text(res.count)
          Cookies.remove('like')
    else
      $.ajax
        url: $(this).data('url')
        type: 'POST'
        success: (res)=>
          $(this).addClass('liked')
          $(this).children('.count').text(res.count)
          Cookies.set('like', res.id)
