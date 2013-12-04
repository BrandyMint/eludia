class Eludia.Views.MenuViewFactory extends Marionette.CollectionView
  tagName: 'ul'
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

    if @selected_item.model.get('items') && @selected_item.$el.hasClass('active')
      @_renderSubmenu()
    else
      @_resetMenus()
      # route

  _toggleState: ->
    @selected_item.$el.toggleClass('active').siblings().removeClass('active')

  _selected_menu_items: ->
    new Eludia.Collections.MenuCollection @selected_item.model.get('items')

  _resetMenus: ->
    App.views.menu_view1.render()
    App.menu_region_level2.reset()
    App.menu_region_level3.reset()