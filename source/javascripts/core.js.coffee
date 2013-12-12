@App = @Eludia.App = new Marionette.Application()

# Параметры:
# container: элемент, в который подгружаем меню
# menu: структура меню
# user: данные для модели юзера

App.addInitializer (options) ->
  App.addRegions
    navbars: options.container
    # TODO переместить в lauyout, где они и создаются
    menu_region_level2: '@navbar-menu-level2'
    menu_region_level3: '@navbar-menu-level3'

  moment.lang('ru')

  App.user = new Eludia.Models.User options.user
  App.urls = options.urls

  App.collections =
    menu_items: new Eludia.Collections.MenuCollection(options.menu, level: 1)

  App.navbars.show App.nav_layout = new Eludia.Views.NavLayout

  App.nav_layout.system.show new Eludia.Views.SystemView
  App.nav_layout.menu.show App.main_menu_view = new Eludia.Views.MainMenuView collection: App.collections.menu_items
  App.nav_layout.iframe.show App.iframe_view = new Eludia.Views.IframeView

  $(document).on "click", (e) =>
    App.main_menu_view.hideSubmenu()

  Backbone.history.start()
