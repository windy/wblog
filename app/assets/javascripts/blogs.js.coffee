# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('.pagination').click ->
    l = window.location.pathname
    page = $(this).attr('data-page')
    window.location= l + "?page=#{page}"
    false
