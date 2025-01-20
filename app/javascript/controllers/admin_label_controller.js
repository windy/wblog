import { Controller } from "@hotwired/stimulus"
import select2 from 'select2'

window.select2 = select2();

export default class extends Controller {
  static targets = [ 'label' ]

  connect() {
    $(this.labelTarget).select2({
      multiple: true,
      tags: false,
    })
  }

  disconnected() {
    $(this.labelTarget).select2('destroy')
  }
}
