class ShoppingCartBackbone.Models.Item extends Backbone.Model
  urlRoot: '/items'

class ShoppingCartBackbone.Collections.Inventory extends Backbone.Collection
  url: '/items'

class ShoppingCartBackbone.Collections.Order extends Backbone.Collection
	url: '/orders'