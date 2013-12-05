class Eludia.Views.MenuItemLevel2 extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  onRender: ->
    if @model.get('items')
      @$el.addClass('node')

  _click: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @model.trigger 'itemview:click', @
