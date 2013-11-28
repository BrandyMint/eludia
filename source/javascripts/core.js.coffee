@App = @Eludia.App = new Marionette.Application()

App.addRegions
  navbars: '@navbars'
  navbar_menu_level2: '@navbar-menu-level2'

App.addInitializer (settings) ->
  App.collections =
    navbar: new Eludia.Collections.NavCollection()
    navbar_menu_level2: new Eludia.Collections.NavCollection()

  new Eludia.Controllers.NavController region: App.navbars

App.vent.on 'navbar_menu_item:clicked', (itemView) ->
  @menu_items = App.collections.navbar.where(label: itemView.model.get('label'))[0].get('items')
  @navbar_menu_level2 = new Eludia.Collections.NavCollection(@menu_items)

  App.navbar_menu_level2.reset()
  App.navbar_menu_level2.show new Eludia.Views.NavbarMenuView collection: @navbar_menu_level2

App.start()