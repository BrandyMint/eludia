class Eludia.Controllers.NavController

  constructor: (options) ->
    App.collections.menu_items.fetch()

    @layout = new Eludia.Views.NavLayout
    options.region.show @layout

    @layout.system.show new Eludia.Views.SystemView
    @layout.menu.show new Eludia.Views.MenuViewLevel1 collection: App.collections.menu_items
