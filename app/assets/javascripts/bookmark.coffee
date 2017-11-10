# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.ellipsis').dotdotdot();

  $('.ui.sidebar')
    .sidebar('setting', 'transition', 'overlay')
    .sidebar('attach events', '.toggle.button', 'toggle')

  $('.bookmark-item .edit.icon').on 'click', (e) ->
    editLink = $(@).attr('data-link')
    location.href = editLink
    e.preventDefault()

  $('.bookmark-item .remove.icon').on 'click', (e) ->
    modalId = $(@).attr('data-modal')
    $("#remove-modal-#{modalId}").modal('show')
    e.preventDefault()
