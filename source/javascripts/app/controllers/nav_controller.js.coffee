class Eludia.Controllers.NavController

  constructor: (options) ->
    App.collections.menu_items.fetch()

    @layout = new Eludia.Views.NavLayout
    options.region.show @layout

    @layout.menu.show new Eludia.Views.MenuView collection: App.collections.menu_items

