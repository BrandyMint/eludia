#= require app/views/menu_views/menu_view_level3
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MenuViewLevel2 extends Eludia.Views.MenuViewBase
  className: 'navbar-menu-level2'
  itemView: Eludia.Views.MenuItemLevel2
  submenuView: Eludia.Views.MenuViewLevel3
  submenuRegion: 'menu_region_level3'
