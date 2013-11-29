class Eludia.Collections.NavCollection extends Backbone.Collection
  url: 'menu.json'

  initialize: (models, options) ->
    @options = options

  parse: (response) ->
    _.each response, (item, index) =>
      item.level = @options.level
      item.id = index

    return response