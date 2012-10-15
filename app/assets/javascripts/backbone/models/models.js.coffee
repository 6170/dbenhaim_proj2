class window.App.Models.Item extends Backbone.Model
  urlRoot: '/items'
  idAttribute: "_id"

class window.App.Models.Shop extends Backbone.Model

class window.App.Collections.Inventory extends Backbone.Collection
  url: '/items'
  model: window.App.Models.Item

class window.App.Collections.ItemList extends Backbone.Collection
  url: '/buy'
  model: window.App.Models.Item

class window.App.Collections.OrderItems extends Backbone.Collection
  model: window.App.Models.Item

class window.App.Models.Order extends Backbone.Model
  urlRoot: '/orders'
  idAttribute: "_id"
  parse: (resp, xhr) ->
    resp.items = new window.App.Collections.OrderItems(resp.items)
    resp
  updateOrder: ->
    total = 0
    for name, item in @.get('items')
      total += @.get('items').at(item).get('price')
    @set('total',total)
  initialize: ->
    @set('total',0)
    @updateOrder()

class window.App.Collections.Orders extends Backbone.Collection
  url: '/orders'
  model: window.App.Models.Order