$(document).on 'turbolinks:load', ->
  if $('.about-page').length > 0
    $(window).scroll ()->
      if $(this).scrollTop() > 0
        $('.top-bar-wrapper').addClass('active')
      else
        $('.top-bar-wrapper').removeClass('active')

    $('#about-top-bar').ddscrollSpy
      highlightclass: 'active'

    $('.intro').ddscrollSpy
      highlightclass: 'active'
