class Eludia.Views.MenuViewBase extends Marionette.CollectionView
  tagName: 'ul'

  # Определяется в наследующих классах:
  #
  #itemView: Eludia.Views.MenuItem
  #submenuView: Eludia.Views.MenuViewLevel2
  #submenuRegion: 'menu_region_level2'

  collectionEvents:
    'itemview:click' : 'onSelect'

  initialize: ->
    @submenu_region = App[@submenuRegion]

  onSelect: (item_view) ->
    if item_view!=@menu_item_view
      @hideSubmenu()
      @activateItem item_view
      @gotoCurrentItem()
    else
      if @submenu_view
        @hideSubmenu()
      else
        @gotoCurrentItem()

  activateItem: (item_view) ->
    @menu_item_view?.deactive()
    @menu_item_view = item_view
    @menu_item_view.active()
    @submenu_item = @menu_item_view.model

  hideSubmenu: ->
    console.log("not implemented")

  onClose: ->
    @hideSubmenu()

  hideSubmenu: ->
    @submenu_view = null
    @submenu_region.close()

  gotoCurrentItem: ->
    if url = @submenu_item.get('href')
      window.App.goto url
    else
      @showSubmenu @menu_item_view

  showSubmenu: (item_view) ->
    @submenu_item = item_view.model
    @submenu_view = new @submenuView collection: @_submenu_collection(item_view), parent_item_view: item_view, parent_collection_view: @
    @submenu_region.show @submenu_view

  setPositionLeft: (el, left, duration = 0) ->
    el.transition
      x: left
      duration: duration

  transitionDuration: ->
    500

  _submenu_collection: (item_view)->
    new Eludia.Collections.MenuCollection item_view.model.get('items')
