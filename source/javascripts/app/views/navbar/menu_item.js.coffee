class Eludia.Views.MenuItem extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  _click: (e) ->
    @model.trigger 'itemview:click', @
    e.stopPropagation()
    e.preventDefault()
