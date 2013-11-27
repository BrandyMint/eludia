@App = @Eludia.App = new Marionette.Application()

App.addRegions
  navbars: '@navbars'

App.addInitializer (settings) ->
  App.collections =
    navbar: new Eludia.Collections.NavCollection()

  new Eludia.Controllers.NavController region: App.navbars

App.start()