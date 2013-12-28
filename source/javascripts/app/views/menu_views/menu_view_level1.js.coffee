#= require app/views/menu_views/menu_view_level2
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MenuViewLevel1 extends Eludia.Views.MenuViewBase
  tagName: 'ul'
  className: 'nav navbar-nav navbar-menu-level1'
  itemView: Eludia.Views.MenuItemLevel1
  submenuView: Eludia.Views.MenuViewLevel2
  submenuRegion: 'menu_region_level2'

  events:
    'dragleft': 'dragMenu'
    'dragright': 'dragMenu'
    'dragstart': 'dragStartMenu'

  dragStartMenu: (e)->
    @hideSubmenu()
    @current_scroll = @$el.scrollLeft()
  
  dragMenu: (e)->
    e.gesture.preventDefault()
    @$el.scrollLeft(@current_scroll + -e.gesture.deltaX)

  scrollAndActivateMenu: (shift) ->
    @scrollMenu shift, @showSubmenuRegion

  scrollMenu: (shift, callback) ->
    currentScroll = @$el.scrollLeft()
    @$el.animate
      scrollLeft: currentScroll + shift
      duration: 500
      queue: true
      complete: callback
    return true
