#= require app/views/menu_views/menu_view_level2
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MenuViewLevel1 extends Eludia.Views.MenuViewBase
  tagName: 'ul'
  className: 'nav navbar-nav navbar-menu-level1'
  itemView: Eludia.Views.MenuItemLevel1
  submenuView: Eludia.Views.MenuViewLevel2
  submenuRegion: 'menu_region_level2'

  onShow: ->
    console.log @submenu_region

  showSubmenu: (item_view) ->
    @submenu_item = item_view.model
    @submenu_view = new @submenuView collection: @_submenu_collection(item_view), parent_item_view: item_view, parent_collection_view: @


  scrollMenu: (shift) ->
  	currentScroll = @$el.scrollLeft()
  	@$el.animate
  		scrollLeft: currentScroll + shift
  		500
      => 
        @submenu_region.show @submenu_view
        
  #TODO change to variable