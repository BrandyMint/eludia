class Eludia.Views.MenuViewLevel4 extends Eludia.Views.MenuViewFactory
  className: 'navbar-menu-level4'

  collectionEvents:
    'itemview:click' : '_itemview_click'

  _itemview_click: ->
    @_resetMenus()
    # route
