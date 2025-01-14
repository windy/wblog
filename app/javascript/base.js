// base dependency library, it should be only shared by `admin.js` and `application.js`.
//
import './libs/add_jquery'

import 'bootstrap/dist/js/bootstrap'

import RailsUjs from '@rails/ujs'
import '@hotwired/turbo'
Turbo.session.drive = false
import * as ActiveStorage from '@rails/activestorage'

RailsUjs.start()
ActiveStorage.start()

import './channels'
import "./controllers"

$(document).on('turbo:load', function(){
  $('[data-toggle="tooltip"]').tooltip()
})
