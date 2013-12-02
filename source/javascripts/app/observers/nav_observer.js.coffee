class Eludia.Observers.NavObserver

  constructor: (options) ->
    @options = options

    @options.model.on 'change:items', (model, items) ->
      level = model.get('level') + 1

      @collection = new Eludia.Collections.MenuCollection(items, level: level, parse: true)
      @view = new Eludia.Views.MenuView collection: @collection
      App["menu_region_level#{level}"].show @view
