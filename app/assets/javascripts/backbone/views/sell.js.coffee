class window.App.Views.shopView extends Backbone.View
  id:"sell"
  template: ''
  events:
    "click #save-new-item": "addItem"

  initialize: ->
    @.setElement($("#sell"))
    _.bindAll @, "render", "addItem"
    @collection.bind "reset", @render
    @collection.bind "add", @render
    @collection.bind "remove", @render
    @shop = @options.shop
    @inventory = @collection
    @

  render: ->
    collection = @collection
    $shop = $(".shopItems")
    $shop.html("")
    @collection.each (item) ->
      view = new window.App.Views.ShopItemView
        model: item
      $shop.append view.render().el
    @

  addItem: ->
    #add item
    item = new App.Models.Item $('#new-item-form').serializeObject()
    item.set('state','Stocked')
    item.save()
    @collection.add item
    $('#newItemModal').modal('hide')


class window.App.Views.ShopItemView extends Backbone.View
  tagName: "div"
  className: "item"
  template: "#seller-item-template"
  events:
    "click .remove-item": "remove"
    "click .editItemModalBtn": "editItem"
    "click .save-edited-item": "saveEdited"

  initialize: ->
    _.bindAll @, "render","editItem","remove"

  editItem: ->
    @$(".editItemModal").modal('show')

  saveEdited: ->
    data = @$(".edit-item-form").serializeObject()
    @model.save(data)
    @$(".editItemModal").modal('hide')
    @render()

  remove: ->
    @model.destroy()

  render: ->
    $(@el).html(Mustache.render($(@template).html(),@model.toJSON()))
    if @model.get("state") != "Stocked"
      @$(".remove-item").attr("disabled","disabled")
    @