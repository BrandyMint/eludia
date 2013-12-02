class Eludia.Views.MenuItemView extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  _click: (e) ->
    if @model.get('items')
      e.preventDefault()
      @_openMenu()
    else
      # reset parent region and send route

    @_toggleState()

  onRender: ->
    if @model.get('level') == 3 && @model.get('items')
      @$el.append @_4th_level_children()

  _openMenu: ->
    App.models.menu_state.set
      items: @model.get('items')
      level: @model.get('level')

  _toggleState: ->
    @$el.toggleClass('active').siblings().removeClass('active')

  _4th_level_children: ->
    collection = new Eludia.Collections.MenuCollection(@model.get('items'), level: @model.get('level')+1, parse: true)
    view = new Eludia.Views.MenuView collection: collection
    view.render().$el
