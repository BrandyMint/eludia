class Eludia.Views.NavbarMenuItemView extends Marionette.ItemView
  template: JST["templates/navbar/navbar_menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  _click: (e) ->
    e.preventDefault()
    @_toggleState()
    App.vent.trigger 'navbar_menu_item:clicked', @

  _toggleState: ->
    @$el.toggleClass('active').siblings().removeClass('active')