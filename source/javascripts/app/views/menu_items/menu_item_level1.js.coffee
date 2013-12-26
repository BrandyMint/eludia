class Eludia.Views.MenuItemLevel1 extends Eludia.Views.MenuItem
  borderLine: 30
  submenuLength: 200

  onRender: ->
    @navbarDefaultShift = @submenuLength
    super

  _clickItem: ->
    if @$el.position().left < @borderLine
      App.menu_view_level1.scrollAndActivateMenu( -1 * @navbarDefaultShift)
    else if $(window).width()-@$el.position().left < @$el.width() + @borderLine*2
      App.menu_view_level1.scrollAndActivateMenu( 1 * @navbarDefaultShift)
    super