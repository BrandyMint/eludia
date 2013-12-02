class Eludia.Views.MenuViewLevel2 extends Marionette.CollectionView
  tagName: 'ul'
  className: 'nav navbar-nav level2'
  itemView: Eludia.Views.MenuItem

  collectionEvents:
    'itemview:click' : 'onSelect'

  onRender: ->
    if @options.selected_item
      @selected_item = @options.selected_item
      @onClose()
      @_toggleState()

  onSelect: (item) ->
    @selected_item = item
    @onClose()
    @_toggleState()

    if @selected_item.model.get('items')
      @_renderSubmenu()
    else
      # App.navbars.reset()

  onClose: ->
    App.views.menu_view3.close() if App.views.menu_view3

  _toggleState: ->
    @selected_item.$el.toggleClass('active').siblings().removeClass('active')

  _renderSubmenu: ->
    App.views.menu_view3 = new Eludia.Views.MenuViewLevel3 collection: @_selected_menu_items()
    @selected_item.$el.append App.views.menu_view3.render().$el

  _selected_menu_items: ->
    new Eludia.Collections.MenuCollection @selected_item.model.get('items')