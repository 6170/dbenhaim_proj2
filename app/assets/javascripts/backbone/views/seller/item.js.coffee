class ShoppingCartBackbone.Views.SellerItemView extends Backbone.View
  tagName: 'div'
  className: 'item span4'
  events:
    'click .remove':'removeItem'

  initialize: ->
    _.bindAll(@,'render')
    @template = $("#seller-item-template").html()
    @model.bind('change',@render)

  render: ->
    $(@el).html(Mustache.render(@template,@model.toJSON()))
    @

  removeItem: ->
    @model.destroy 
    false

  edit: ->
    @model.set
      name: $("#name").val()
      grapes: $("#grapes").val()
      country: $("#country").val()
      region: $("#region").val()
      year: $("#year").val()
      description: $("#description").val()
    if @model.isNew()
      app.wineList.create @model
    else
      @model.save()
    false

class ShoppingCartBackbone.Views.SellerInventoryView extends Backbone.View
  tagName: 'div'
  className: 'inventory'
  events:
    'click #add': 'addNewItem'

  initialize: ->
    _.bindAll(@,'render','addNewItem')
    @template = $("#seller-inventory-template").html()
    @collection.bind('reset',@render)
    @collection.bind('add', @render);
    @

  addNewItem: ->
    console.log @collection
    @collection.add(new ShoppingCartBackbone.Models.Item({title:"new object",price:2000.00,src:"",img_src:""}))
    @collection.reset()

  render: ->
    $inventory = $(".inventory")
    $inventory.html("")
    num_items = 0
    $inventory.append('<div class="row-fluid current_row"></div>')
    $current_row = $('.current_row')
    @collection.each (item) ->
      view = new ShoppingCartBackbone.Views.SellerItemView(
        model: item
        collection: @collection
      )
      $current_row.append view.render().el
      num_items += 1
      if num_items % 3 == 0
        $('.current_row').removeClass('current_row')
        $inventory.append('<div class="row-fluid current_row"></div>')
        $current_row = $('.current_row')
    $('.current_row').removeClass('current_row')
    @