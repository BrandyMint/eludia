window.APP =
  Routers : {}
  Models : {}
  Controllers : {}
  Collections : {}
  Views : 
    Items : {}
    Collections : {}
    Regions : {}
    Composites : {}
    Layouts : {}
  Helpers : {}
  MarionetteApp : new Backbone.Marionette.Application()

  init : ->
    @MarionetteApp.bind 'initialize:after', (options) ->
      @controller = new APP.Controllers.App()
      @router = new APP.Routers.App { @controller }

      APP.Controllers.app = @controller
      APP.Routers.app = @router

      # Start Backbone history
      if Backbone.history then Backbone.history.start {pushState : true, hashChange: false}

      
    @MarionetteApp.start()

$(document).ready -> APP.init()