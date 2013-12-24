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
    @navbarDefaultShift = Eludia.Helpers.ApplicationHelpers.windowWidth() / 3
    if @model.get('items')
      @$el.addClass('menu-item-parent')
    if @model.get('title').length >= @titleLength
      @_prepareTooltip()

  active: ->
    @$el.addClass 'active'

  deactive: ->
    @$el.removeClass 'active'

  _clickItem: (e) ->
    tag = switch
      when @$el.position().left < 30 then -1
      when $(window).width()-@$el.position().left in [31..180] then 1
      else 0
    @_navbarScroll(tag * @navbarDefaultShift)
    e.preventDefault()
    e.stopPropagation()
    @model.trigger 'itemview:click', @

  _stopClick: (e) ->
    e.preventDefault(e)
    false

  _prepareTooltip: ->
    @$el.attr 'data-toggle', 'tooltip'
    @$el.attr 'data-original-title', @model.get 'title'
    @$el.attr 'data-placement', @tooltipPosition
    @$el.tooltip()

  _navbarScroll: (shift) ->
    currentScroll = App.menu_view_level1.$el.scrollLeft()
    App.menu_view_level1.$el.animate
      scrollLeft: currentScroll + shift
      500


