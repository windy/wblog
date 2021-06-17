import { Controller } from "stimulus"
import '../js/libs/qrcode'

export default class extends Controller {
  static targets = [ 'wrapper' ]
  connect() {
  }

  greet(e) {
    e.preventDefault()
    $('#image-tag').empty()
    new QRCode( $('#image-tag')[0], $('#image-tag').data('url') )
    $(this.wrapperTarget).toggle()
  }
}
