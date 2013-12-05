@App.goto= (url_name) ->
  Backbone.history.navigate Eludia.Helpers.ApplicationHelpers.url(url_name), trigger: true
