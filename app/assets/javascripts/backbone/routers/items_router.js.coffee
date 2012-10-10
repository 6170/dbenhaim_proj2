class ShoppingCartBackbone.Router extends Backbone.Router
  routes:
    '': 'home'
    'sell': 'showSell'
    'buy': 'showBuy'

  initialize: ->
    @inventory = new ShoppingCartBackbone.Collections.Inventory()
    @inventory.fetch()
    @sellerView = new ShoppingCartBackbone.Views.SellerInventoryView
      collection:@inventory
    @sellerView.render()

  home: ->
    #$('#main').html view.render().el

  showSell: ->
    @buyerView.hide();
    @sellerView.show();

  showBuy: ->
    @sellerView.hide();
    @buyerView.show();

