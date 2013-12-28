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
    data.original_title = @model.get('title')
    data.title = @truncate data.title, @titleLength
    data.placement = @tooltipPosition 
    data

  onRender: ->
    if @model.get('items')
      @$el.addClass('menu-item-parent')
    @$el.find("[data-toggle='tooltip']:first").tooltip() if @model.get('title').length >= @titleLength

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

