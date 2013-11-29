class Eludia.Views.NavbarMenuItemView extends Marionette.ItemView
  template: JST["templates/navbar/navbar_menu_item"]
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

  render: ->
    if @model.get('level') == 3 && @model.get('items')
      super.$el.append @_children()
    else
      super

  _openMenu: ->
    App.models.menu.set
      items: @model.get('items')
      level: @model.get('level')

  _toggleState: ->
    @$el.toggleClass('active').siblings().removeClass('active')

  _children: ->
    collection = new Eludia.Collections.NavCollection(@model.get('items'), level: @model.get('level')+1, parse: true)
    view = new Eludia.Views.NavbarMenuView collection: collection
    view.render().$el
