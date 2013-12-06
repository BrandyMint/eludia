#= require app/views/menu_views/menu_view_level3
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MenuViewLevel2 extends Eludia.Views.MenuViewBase
  className: 'navbar-menu-level2'
  itemView: Eludia.Views.MenuItemLevel2
  submenuView: Eludia.Views.MenuViewLevel3
  submenuRegion: 'menu_region_level3'

  initialize: ->
    _.extend @, Eludia.Helpers.ApplicationHelpers
    # using helper @windowWidth
    super

  onShow: ->
    $parentEl = @options.parent_item_view.$el
    parentPos = $parentEl.position()
    parentLeft = parentPos.left
    maxLeftPos = @windowWidth() - @$el.width()

    if parentLeft < maxLeftPos
      @setPositionLeft(@$el, parentLeft)
    else
      @setPositionLeft(@$el, maxLeftPos)

  onSelect: (item_view) ->
    if item_view.model.get('items')
      position = @$el.position()
      @initPosition = position.left
      @setPositionLeft(@$el, 0, @transitionDuration())
      @shifted = true
    super


