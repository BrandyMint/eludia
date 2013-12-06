#= require app/views/menu_items/menu_item_level3
#= require_self

class Eludia.Views.MenuViewLevel3 extends Eludia.Views.MenuViewBase
  className: 'navbar-menu-level3'
  itemView: Eludia.Views.MenuItemLevel3

  initialize: ->
    _.extend @, Eludia.Helpers.ApplicationHelpers
    # using helper @windowWidth
    super

  onRender: ->
    @setPositionLeft(@$el, @parentPosLeft())

  onShow: ->
    duration = @transitionDuration()
    console.log duration
    @setPositionLeft(@$el, 0, duration)

  parentPosLeft: ->
    level2Menu = @options.parent_collection_view
    level2Menu.initPosition

  #_itemview_click: (item) ->
    #@selected_item = item
    #if !@selected_item.model.get('items')
      #@_resetMenus()
      ## route
  hideSubmenu: ->
    # do nothing
