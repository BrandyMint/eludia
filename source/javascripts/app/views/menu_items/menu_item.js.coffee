class Eludia.Views.MenuItem extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'
  templateHelpers: -> Eludia.Helpers.ApplicationHelpers

  events:
    'click' : '_click'

  onRender: ->
    if @model.get('items')
      @$el.addClass('menu-item-parent')

  active: ->
    @$el.addClass 'active'

  deactive: ->
    @$el.removeClass 'active'

  _click: (e) ->
    e.stopPropagation()
    e.preventDefault()
    @model.trigger 'itemview:click', @
