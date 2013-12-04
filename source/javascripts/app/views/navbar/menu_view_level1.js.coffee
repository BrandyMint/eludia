class Eludia.Views.MenuViewLevel1 extends Eludia.Views.MenuViewFactory
  className: 'nav navbar-nav navbar-menu-level1'

  onClose: ->
    App.menu_region_level2.reset()
    App.menu_region_level3.reset()

  _renderSubmenu: ->
    @menu_view2 = new Eludia.Views.MenuViewLevel2 collection: @_selected_menu_items()
    App.menu_region_level2.show @menu_view2
