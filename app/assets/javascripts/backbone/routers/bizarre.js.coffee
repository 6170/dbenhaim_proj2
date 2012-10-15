class window.App.Routers.Bizarre extends Backbone.Router
  routes:
    '': 'home'
    'sell': 'showSell'
    'buy': 'showBuy'
    'orders':'showOrders'

  initialize: ->
    #shopview needs shop and items
    @shop = new window.App.Models.Shop()
    @inventory = new window.App.Collections.Inventory()
    @shop.inventory = @inventory
    @inventory.fetch()
    @shopView = new window.App.Views.shopView
      collection: @inventory
      shop: @shop
    @itemlist = new window.App.Collections.ItemList()
    @itemlist.fetch()
    @buyview = new window.App.Views.buyView
      collection: @itemlist
    @orders = new window.App.Collections.Orders()
    @orders.bind "reset", @updateCurrentOrder
    @orders.fetch()
    @orderview = new window.App.Views.OrdersView
      collection: @orders

  home: ->
    @showOrders()

  updateCurrentOrder: =>
    if @orders.where({state:"Active"}).length
      window.App.currentOrder = @orders.where({state:"Active"})[0].id

  hideAll: ->
    $("#orders").hide()
    $("#buy").hide()
    $("#sell").hide()

  showSell: ->
    @hideAll()
    @inventory.fetch()
    @shopView.render()
    $("#sell").show()

  showBuy: ->
    @hideAll()
    @itemlist.fetch()
    @buyview.render()
    $("#buy").show()

  showOrders: ->
    @hideAll()
    @orders.fetch()
    $("#orders").show()

# App.Controllers.Documents = Backbone.Controller.extend(
#   routes:
#     "documents/:id": "edit"
#     "": "index"
#     'new': "newDoc"

#   edit: (id) ->
#     doc = new Document(id: id)
#     doc.fetch
#       success: (model, resp) ->
#         new App.Views.Edit(model: doc)

#       error: ->
#         new Error(message: "Could not find that document.")
#         window.location.hash = "#"


#   index: ->
#     $.getJSON "/documents", (data) ->
#       if data
#         documents = _(data).map((i) ->
#           new Document(i)
#         )
#         new App.Views.Index(documents: documents)
#       else
#         new Error(message: "Error loading documents.")


#   newDoc: ->
#     new App.Views.Edit(model: new Document())
# )