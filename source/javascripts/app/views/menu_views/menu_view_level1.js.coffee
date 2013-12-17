#= require app/views/menu_views/menu_view_level2
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MenuViewLevel1 extends Eludia.Views.MenuViewBase
  tagName: 'ul'
  className: 'nav navbar-nav navbar-menu-level1'
  itemView: Eludia.Views.MenuItemLevel2
  submenuView: Eludia.Views.MenuViewLevel2
  submenuRegion: 'menu_region_level2'

  onSelect: (item_view) ->
    @main_menu_view = @options.main_menu_view

    itemViewLeft = item_view.$el.position().left
    itemViewWidth = item_view.$el.width()

    if @main_menu_view.$el.width() < itemViewLeft + itemViewWidth - 30
      @main_menu_view.level1Scroll(itemViewLeft + itemViewWidth + 30)
      @level1Scrolled = true
    else if itemViewLeft < 0
      @main_menu_view.level1Scroll(itemViewLeft - itemViewWidth - 30)
      @level1Scrolled = true
    else
      @level1Scrolled = false

    super


