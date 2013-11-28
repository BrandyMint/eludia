class Eludia.Controllers.NavController

  constructor: (options) ->
    App.collections.navbar.fetch()

    @layout = new Eludia.Views.NavLayout
    options.region.show @layout

    # @layout.system.show new Eludia.Views.NavbarSystemView collection: App.collections.navbar
    @layout.menu.show new Eludia.Views.NavbarMenuView collection: App.collections.navbar

