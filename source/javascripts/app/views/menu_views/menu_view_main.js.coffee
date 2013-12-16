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
    'tap @level1-arrow-left' : '_level1ScrollLeft'
    'tap @level1-arrow-right' : '_level1ScrollRight'
    'click @level1-arrow-left, click @level1-arrow-right' : '_stopClick'

  ui:
    level1_items: '@level1-items'

  onRender: ->
    @level1DefaultShift = Eludia.Helpers.ApplicationHelpers.windowWidth() / 3
    App.menu_view_level1 = new @level1View collection: @collection
    @$el.append App.menu_view_level1.render().$el

  onShow: ->
    @_checkScrollable()
    $(window).on 'resize.level1', () =>
      @_checkScrollable()

  onBeforeClose: ->
    $(window).off 'resize.level1'
    App.menu_view_level1.close()
    App.menu_view_level1 = null

  hideSubmenu: ->
    App.menu_view_level1?.hideSubmenu()

  resetMenu: ->
    @hideSubmenu()
    App.menu_view_level1.deactivateCurrentItem()

  _checkScrollable: ->
    fPos = App.menu_view_level1.$el.children().first().position()
    lPos = App.menu_view_level1.$el.children().last().position()
    if (lPos.left - fPos.left) > $(window).width()
      @$el.addClass('level1-scrollable')
    else
      @$el.removeClass('level1-scrollable')


  _level1ScrollLeft: ->
    @_level1Scroll( -1 * @level1DefaultShift)

  _level1ScrollRight: ->
    @_level1Scroll(@level1DefaultShift)

  _level1Scroll: (shift) ->
    currentScroll = App.menu_view_level1.$el.scrollLeft()
    App.menu_view_level1.$el.animate
      scrollLeft: currentScroll + shift
      500

  _stopClick: (e) ->
    e.preventDefault(e)
    false

