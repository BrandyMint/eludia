class Eludia.Views.MenuViewLevel3 extends Eludia.Views.MenuViewFactory
  className: 'navbar-menu-level3'
  itemView: Eludia.Views.MenuItemLevel3

  collectionEvents:
    'itemview:click' : '_itemview_click'

  _itemview_click: (item) ->
    @selected_item = item
    if !@selected_item.model.get('items')
      @_resetMenus()
      # route
