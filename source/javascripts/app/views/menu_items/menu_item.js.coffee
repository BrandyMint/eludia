class Eludia.Views.MenuItem extends Marionette.ItemView
  template: JST["app/templates/navbar/menu_item"]
  tagName: 'li'
  templateHelpers: -> Eludia.Helpers.ApplicationHelpers
  titleLength: 32
  tooltipPosition: 'bottom'
  borderLine: 30

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
    @navbarDefaultShift = @windowWidth() / 3
    if @model.get('items')
      @$el.addClass('menu-item-parent')
    if @model.get('title').length >= @titleLength
      @_prepareTooltip()

  active: ->
    @$el.addClass 'active'

  deactive: ->
    @$el.removeClass 'active'

  _clickItem: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if @$el.position().left < @borderLine
      App.menu_view_level1.scrollMenu( -1 * @navbarDefaultShift)
    else if $(window).width()-@$el.position().left < @$el.width() + @borderLine*2
      App.menu_view_level1.scrollMenu( 1 * @navbarDefaultShift)
    @model.trigger 'itemview:click', @

  _stopClick: (e) ->
    e.preventDefault(e)
    false

  _prepareTooltip: ->
    @$el.attr 'data-toggle', 'tooltip'
    @$el.attr 'data-original-title', @model.get 'title'
    @$el.attr 'data-placement', @tooltipPosition
    @$el.tooltip()

