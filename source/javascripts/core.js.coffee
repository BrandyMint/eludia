@App = @Eludia.App = new Marionette.Application()

App.addRegions
  navbars: '@navbars'
  menu_region_level2: '@navbar-menu-level2'
  menu_region_level3: '@navbar-menu-level3'

App.addInitializer (settings) ->
  moment.lang('ru')
  App.views = {}

  App.collections =
    menu_items: new Eludia.Collections.MenuCollection([], level: 1)

  new Eludia.Controllers.NavController region: App.navbars

  Backbone.history.start()
