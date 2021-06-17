// base dependency library, it should be only shared by `admin.js` and `application.js`.
import 'jquery'
import 'bootstrap/dist/js/bootstrap'

import RailsUjs from '@rails/ujs'
import Turbo from '@hotwired/turbo'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

const images = require.context('images', true)
const imagePath = (name) => images(name, true)

RailsUjs.start()
ActiveStorage.start()

$(document).on('turbo:load', function(){
  $('[data-toggle="tooltip"]').tooltip()
})
