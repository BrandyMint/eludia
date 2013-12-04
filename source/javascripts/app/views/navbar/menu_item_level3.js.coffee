class Eludia.Views.MenuItemLevel3 extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  _click: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @model.trigger 'itemview:click', @

  onRender: ->
    if @model.get('items')
      @_renderSubmenu()

  _renderSubmenu: ->
    @menu_view4 = new Eludia.Views.MenuViewLevel4 collection: @_selected_menu_items()
    @$el.append @menu_view4.render().$el

  _selected_menu_items: ->
    new Eludia.Collections.MenuCollection @model.get('items')
