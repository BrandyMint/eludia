#= require app/views/menu_views/menu_view_base
#= require app/views/menu_items/menu_item
#= require_self


class Eludia.Views.MenuViewLevel4 extends Eludia.Views.MenuViewBase
  className: 'navbar-menu-level4'
  itemView: Eludia.Views.MenuItem

  #collectionEvents:
    #'itemview:click' : '_itemview_click'

  #_itemview_click: ->
    #@_resetMenus()
    ## route

  hideSubmenu: ->
    console.log 'hide'
    # do nothing
