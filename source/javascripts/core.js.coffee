@App = @Eludia.App = new Marionette.Application()

App.addRegions
  navbars: '@navbars'
  menu_region_level2: '@navbar-menu-level2'
  menu_region_level3: '@navbar-menu-level3'


# Параметры:
# menu: структура меню
# user: данные для модели юзера

App.addInitializer (options) ->
  moment.lang('ru')
  App.views = {}

  App.user = new Eludia.Models.User options.user

  App.collections =
    menu_items: new Eludia.Collections.MenuCollection(options.menu, level: 1)

  App.navbars.show App.nav_layout = new Eludia.Views.NavLayout

  new Eludia.Controllers.NavController
    nav_layout: App.nav_layout
    user: App.user

  moment.lang('ru')

  Backbone.history.start()
