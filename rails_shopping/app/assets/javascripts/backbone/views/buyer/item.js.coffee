class ShoppingCartBackbone.Views.BuyerItemView extends Backbone.View
  tag: 'li'
  className: 'item'

  initialize: ->
    _.bindAll(@,'render')
    @template = _.template($("#seller-item-template").html())
    @model.bind('change',@render)

  render: ->
    $(@el).html(@.template(@model.toJSON()))
    @


class ShoppingCartBackbone.Views.BuyerForSaleView extends Backbone.View
  tag: 'div'
  className: 'inventory'

  initialize: ->
    _.bindAll(@,'render')
    @template = _.template($("#seller-inventory-template").html())
    @collection.bind('reset',@render)

  render: ->
    $inventory = $(".inventory")
    @collection.each (item) ->
      view = new ShoppingCartBackbone.Views.SellerItemView(
        model: item
        collection: @collection
      )
      $inventory.append view.render().el
    @

class ShoppingCartBackbone.Views.BuyerOrderView extends Backbone.View
  