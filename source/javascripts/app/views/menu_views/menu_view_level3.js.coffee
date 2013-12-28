#= require app/views/menu_views/menu_view_base
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
    @gridSort()
    duration = @transitionDuration()
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

  gridSort: ->
    @level3items = @.children._views
    for item of @level3items
      item = @level3items[item]
      if item.model.get('items') && @childrenOverflow() == true
        @allowGridSort = true
    if @allowGridSort == true
      @$el.css('height', '500px')
      @$el.isotope({layoutMode: 'masonryHorizontal'})
      @$el.addClass 'menu-level3-large'
      @$el.css('width', '100%').css('height', 'auto').css('position', 'absolute').css('overflow', 'auto').css('bottom', '0')
    else
      if @childrenOverflow() == true
        @$el.addClass 'content-columns'
      else
        @singleColumn = true
        @$el.addClass 'single-column'
        @.trigger 'level3menu:single_column'


