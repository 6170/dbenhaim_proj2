# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  # Setup drop down menu
  $(".dropdown-toggle").dropdown()
  # Fix input element click problem
  $(".dropdown input, .dropdown label").click (e) ->
    e.stopPropagation()
_.templateSettings =
    interpolate: /\{\{\=(.+?)\}\}/g
    evaluate: /\{\{(.+?)\}\}/g
$.fn.serializeObject = ->
  o = {}
  a = @serializeArray()
  $.each a, ->
    if o[@name] isnt `undefined`
      o[@name] = [o[@name]]  unless o[@name].push
      o[@name].push @value or ""
    else
      o[@name] = @value or ""
  o

$(document).ready ->
	$('#add-item').click ->
		$.ajax
			url: '/items'
			data: $('#new-item-form').serializeObject()
			type: 'POST'
			success: (data) ->
				location.reload()
		$('#newItemModal').modal('hide')
	$('.remove-item').click ->
		$("#accordion-item-"+$(this).data('item-id')).slideUp()
		$.ajax
			url: '/items/'+$(this).data('item-id')
			data: {id:$(this).data('item-id')}
			type: 'DELETE'
	$(".add_to_cart").click ->
		$.ajax
			url: '/items/'+$(this).attr('id')
			data: {id:$(this).attr('id'), state:'In Cart'}
			type: 'PUT'
			success: (data) ->
				location.reload()
	$(".place_order").click ->
		$.ajax
			url: '/orders/'+$(this).attr('id')
			data: {id:$(this).attr('id'), state:'Ordered'}
			type: 'PUT'
			success: (data) ->
				location.reload()
	$(".buy").click ->
		$("#sell").hide()
		$("#buy").show()
	$(".sell").click ->
		$("#buy").hide()
		$("#sell").show()