class Eludia.Views.NavbarMenuItemView extends Marionette.ItemView
  template: JST["templates/navbar/navbar_menu_item"]
  tagName: 'li'

  events:
    'click' : '_click'

  _click: ->
    App.vent.trigger 'navbar_menu_list_item:clicked', @
