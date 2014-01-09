#= require app/views/menu_views/menu_view_level4
#= require_self

class Eludia.Views.MenuItemLevel3 extends Eludia.Views.MenuItem
  onRender: ->
    if @model.get('items')
      @_renderSubmenu()
    super

  addTooltip: ->
    @collectionView = @options.collectionView
    @listenTo @collectionView, 'transitions:end', @_prepareTooltip

  _prepareTooltip: ->
    if @model.get('title').length >= @titleLength
      @$el.find("[data-toggle='tooltip']:first").tooltip({container: "#{@tooltipContainer()}"})

  _renderSubmenu: ->
    @menu_view4 = new Eludia.Views.MenuViewLevel4 collection: new Eludia.Collections.MenuCollection @model.get('items')
    @$el.append @menu_view4.render().$el
