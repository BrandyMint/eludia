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

  #onRender: ->
    #if @options.selected_item
      #@selected_item = @options.selected_item
      ## @onClose()
      #@_toggleState()

  onSelect: (item_view) ->
    if item_view!=@submenu_item_view
      @hideSubmenu()
      @showSubmenu item_view

    #@_toggleState()

    #if @selected_item.model.get('items') && @selected_item.$el.hasClass('active')
      #@_renderSubmenu()
    #else
      ## route

  hideSubmenu: ->
    console.log("not implemented")

  onClose: ->
    @hideSubmenu()

  hideSubmenu: ->
    @submenu_item = null
    @submenu_view = null
    @submenu_region.close()

  showSubmenu: (item_view) ->
    @submenu_item_view = item_view
    @submenu_item = item_view.model

    @submenu_view = new @submenuView collection: @_submenu_collection()
    @submenu_region.show @submenu_view

  #_toggleState: ->
    #@selected_item.$el.toggleClass('active').siblings().removeClass('active')

  _submenu_collection: ->
    new Eludia.Collections.MenuCollection @submenu_item.get('items')
