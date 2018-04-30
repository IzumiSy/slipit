# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  document.querySelectorAll('.ellipsis3').forEach (q) ->
    $clamp(q, { clamp: 3 });
  document.querySelectorAll('.ellipsis2').forEach (q) ->
    $clamp(q, { clamp: 2 });
  document.querySelectorAll('.ellipsis1').forEach (q) ->
    $clamp(q, { clamp: 1 });

  $('.ui.dropdown').dropdown()

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

  $('#add-tag').on 'click', (e) ->
    $('#new-tag-modal').modal 'show'
  $('#add-bookmark').on 'click', (e) ->
    $('#new-bookmark-modal').modal 'show'

  $('#delete-bookmarks').on 'click', (e) ->
    $('#delete-bookmarks-modal').modal 'show'
  $('#delete-account').on 'click', (e) ->
    $('#delete-account-modal').modal 'show'
