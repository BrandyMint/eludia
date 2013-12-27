class Eludia.Views.MenuItem extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'
  templateHelpers: -> Eludia.Helpers.ApplicationHelpers
  titleLength: 32
  tooltipPosition: 'bottom'

  initialize: ->
    _.extend @, Eludia.Helpers.ApplicationHelpers
    
  events:
    'tap' : '_clickItem'
    'click': '_stopClick'

  serializeData: ->
    data = super
    data.title = @truncate data.title, @titleLength
    data

  onRender: ->
    if @model.get('items')
      @$el.addClass('menu-item-parent')
    if @model.get('title').length >= @titleLength
      @_prepareTooltip()

  onShow: ->
    @$el.tooltip()

  active: ->
    @$el.addClass 'active'

  deactive: ->
    @$el.removeClass 'active'

  _clickItem: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.trigger 'itemview:click', @

  _stopClick: (e) ->
    e.preventDefault(e)
    false

  _prepareTooltip: ->
    @$el.attr 'data-toggle', 'tooltip'
    @$el.attr 'data-original-title', @model.get 'title'
    @_prepareTooltipPlacement()

  _prepareTooltipPlacement: (placement = @tooltipPosition) ->
      @$el.attr 'data-placement', placement

