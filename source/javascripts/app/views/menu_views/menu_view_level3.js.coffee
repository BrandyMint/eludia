#= require app/views/menu_items/menu_item_level3
#= require_self

class Eludia.Views.MenuViewLevel3 extends Eludia.Views.MenuViewBase
  className: 'navbar-menu-level3'
  itemView: Eludia.Views.MenuItemLevel3

  #collectionEvents:
    #'itemview:click' : '_itemview_click'

  #_itemview_click: (item) ->
    #@selected_item = item
    #if !@selected_item.model.get('items')
      #@_resetMenus()
      ## route
  hideSubmenu: ->
    # do nothing
