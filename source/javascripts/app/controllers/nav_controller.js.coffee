class Eludia.Controllers.NavController

  # Параметры:
  # nav_layout
  # user
  constructor: (options) ->
    @layout = options.nav_layout

    a = new Eludia.Views.SystemView model: options.user
    @layout.system.show a

    $(document).on "click", (e) =>
      # TODO: re-render 1st level and reset regions
      @_showMenu()

    @_showMenu()

  _showMenu: ->
    App.views.menu_view1 = new Eludia.Views.MenuViewLevel1 collection: App.collections.menu_items
    @layout.menu.show App.views.menu_view1
