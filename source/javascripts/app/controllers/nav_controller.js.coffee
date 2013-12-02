class Eludia.Controllers.NavController

  constructor: (options) ->
    App.collections.menu_items.fetch()

    @layout = new Eludia.Views.NavLayout
    options.region.show @layout

    $(document).on "click", (e) =>
      # TODO: re-render 1st level and reset regions
      @_showMenu()

    @_showSystemNav()
    @_showMenu()

  _showSystemNav: ->
    @layout.system.show new Eludia.Views.SystemView

  _showMenu: ->
    App.views.menu_view1 = new Eludia.Views.MenuViewLevel1 collection: App.collections.menu_items
    @layout.menu.show App.views.menu_view1
