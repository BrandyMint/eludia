class Eludia.Views.MenuViewLevel2 extends Eludia.Views.MenuViewFactory
  className: 'nav navbar-nav navbar-menu-level2'

  onClose: ->
    App.menu_region_level3.reset()

  _renderSubmenu: ->
    @menu_view3 = new Eludia.Views.MenuViewLevel3 collection: @_selected_menu_items()
    App.menu_region_level3.show @menu_view3
