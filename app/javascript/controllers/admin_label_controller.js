import { Controller } from "stimulus"
import 'select2'
import 'select2/dist/css/select2.css'
import '@ttskch/select2-bootstrap4-theme/dist/select2-bootstrap4.css'

export default class extends Controller {
  static targets = [ 'label' ]

  connect() {
    $(this.labelTarget).select2({
      theme: 'bootstrap4',
      multiple: true,
      tags: false,
    })
  }

  disconnected() {
    $(this.labelTarget).select2('destroy')
  }
}
