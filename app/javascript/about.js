import './libs/ddscrollspy'

$(document).on('turbo:load', function(){
  if($('.home-about-page').length === 0) { return; }

  $(window).scroll(function(){
    if($(this).scrollTop() > 0)
      $('.top-bar-wrapper').addClass('active')
    else
      $('.top-bar-wrapper').removeClass('active')
  })

  $('#about-top-bar').ddscrollSpy({highlightclass: 'active'})

  $('#about-anchor-link').click(function(e){
    e.preventDefault()
    $('html, body').animate({
      scrollTop: $('#about').offset().top
    },500)
  })
})
