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
  $(document).hammer()

  #Modernizr.Detectizr.detect()
  #App.browser = {
  #  name: Modernizr.Detectizr.device.browser,
  #  version: Modernizr.Detectizr.device.browserVersion
  #}

  if (!$.support.transition)
    $.fn.transition = $.fn.animate

  $(document).on "tap", (e) =>
    App.main_menu_view.resetMenu()

  unless window.location.href.search("no_blur") > 0
    $(window).on "blur", (e) ->
      App.main_menu_view.resetMenu()

  App.user = new Eludia.Models.User options.user
  App.urls = options.urls

  App.collections =
    menu_items: new Eludia.Collections.MenuCollection(options.menu)

  App.navbars.show App.nav_layout = new Eludia.Views.NavLayout

  App.nav_layout.system.show new Eludia.Views.SystemView
  App.nav_layout.menu.show App.main_menu_view = new Eludia.Views.MainMenuView collection: App.collections.menu_items

  Eludia.Helpers.ApplicationHelpers.iframe_show options.urls.logo

  Backbone.history.start()
