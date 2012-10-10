#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.ShoppingCartBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new ShoppingCartBackbone.Router
    Backbone.history.start()

$(document).ready ->
  ShoppingCartBackbone.init()