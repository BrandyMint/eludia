#= require app/views/menu_views/menu_view_level2
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MainMenuView extends Marionette.ItemView
  tagName: 'div'
  className: 'navbar-menu-level1-container'
  template: JST["app/templates/navbar/menu_main"]
  level1View: Eludia.Views.MenuViewLevel1

  templateHelpers: -> Eludia.Helpers.ApplicationHelpers

  events:
    'click @level1-arrow-left' : '_level1ScrollLeft'
    'click @level1-arrow-right' : '_level1ScrollRight'

  ui:
    level1_items: '@level1-items'

  onRender: ->
    @level1MenuView = new @level1View collection: @collection
    @$el.append @level1MenuView.render().$el

  onShow: ->
    @_checkScrollable()
    $(window).on 'resize.level1', () =>
      @_checkScrollable()

  onBeforeClose: ->
    $(window).off 'resize.level1'
    @level1MenuView.close()
    @level1MenuView = null

  _checkScrollable: ->
    fPos = @level1MenuView.$el.children().first().position()
    lPos = @level1MenuView.$el.children().last().position()
    if (lPos.left - fPos.left) > $(window).width()
      @$el.addClass('level1-scrollable')
    else
      @$el.removeClass('level1-scrollable')


  _level1ScrollLeft: ->
    @_level1Scroll(-300)

  _level1ScrollRight: ->
    @_level1Scroll(300)

  _level1Scroll: (shift) ->
    currentScroll = @level1MenuView.$el.scrollLeft()

    @level1MenuView.$el.animate
      scrollLeft: currentScroll + shift
      500


