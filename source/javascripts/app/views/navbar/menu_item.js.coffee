class Eludia.Views.MenuItem extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  _click: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @model.trigger 'itemview:click', @
