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
    @menu_state = new Eludia.Models.MenuState

  onSelect: (item_view) ->
    if item_view!=@submenu_item_view
      @hideSubmenu()
      @showSubmenu item_view

    item_view.active()

  hideSubmenu: ->
    console.log("not implemented")

  onClose: ->
    @hideSubmenu()

  hideSubmenu: ->
    @submenu_item_view?.deactive()
    @submenu_item = null
    @submenu_view = null
    @submenu_item_view = null
    @submenu_region.close()

  showSubmenu: (item_view) ->
    @submenu_item_view = item_view
    @submenu_item = item_view.model

    @submenu_view = new @submenuView collection: @_submenu_collection(), menu_state: @menu_state
    @submenu_region.show @submenu_view

  _submenu_collection: ->
    new Eludia.Collections.MenuCollection @submenu_item.get('items')
