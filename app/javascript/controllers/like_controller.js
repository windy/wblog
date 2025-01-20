import { Controller } from "@hotwired/stimulus"
import Cookies from 'js-cookie'

export default class extends Controller {
  static targets = [ 'button' ]

  toggle(e) {
    let button = $(this.buttonTarget)
    if( button.hasClass('liked') ){
      $.ajax({
        url: button.data('url') + '/' + Cookies.get('like'),
        type: 'DELETE',
        success: function(res){
          button.removeClass('liked')
          button.children('.count').text(res.count)
          Cookies.remove('like')
        }
      })
    }else{
      $.ajax({
        url: button.data('url'),
        type: 'POST',
        success: function(res){
          button.addClass('liked')
          button.children('.count').text(res.count)
          Cookies.set('like', res.id)
        }
      })
    }
  }
}
