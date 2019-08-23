# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a[data-remote]").on "ajax:complete", (event) ->
    w = $('#like'+event.target.id)
    y = $('#unlike'+event.target.id)
    if w.hasClass("d-none")
        w.removeClass("d-none")
        y.addClass("d-none")
    else
        w.addClass("d-none")
        y.removeClass("d-none")