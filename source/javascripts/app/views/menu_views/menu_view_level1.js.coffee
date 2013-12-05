#= require app/views/menu_views/menu_view_level2
#= require app/views/menu_items/menu_item_level2
#= require_self

class Eludia.Views.MenuViewLevel1 extends Eludia.Views.MenuViewBase
  tagName: 'div'
  className: 'navbar-menu-level1-container'
  template: JST["app/templates/navbar/menu_level1"]
  itemView: Eludia.Views.MenuItemLevel2
  itemViewContainer: '@level1-items'
  submenuView: Eludia.Views.MenuViewLevel2
  submenuRegion: 'menu_region_level2'

  events:
    'click @level1-arrow-left' : '_level1ScrollLeft'
    'click @level1-arrow-right' : '_level1ScrollRight'

  onShow: ->
    @_checkScrollable()
    $(window).on 'resize.level1', () =>
      @_checkScrollable()

  onBeforeClose: ->
    $(window).off 'resize.level1'

  _checkScrollable: ->
    fPos = @.$itemViewContainer.children().first().position()
    lPos = @.$itemViewContainer.children().last().position()
    if (lPos.left - fPos.left) > $(window).width()
      @$el.addClass('level1-scrollable')
    else
      @$el.removeClass('level1-scrollable')


  _level1ScrollLeft: ->
    @_level1Scroll(-300)

  _level1ScrollRight: ->
    @_level1Scroll(300)

  _level1Scroll: (shift) ->
    currentScroll = @.$itemViewContainer.scrollLeft()

    @.$itemViewContainer.animate
      scrollLeft: currentScroll + shift
      500


