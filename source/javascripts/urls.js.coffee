@App.goto= (url) ->
  window.location.href = url
  #Backbone.history.navigate url, trigger: true

@App.goto_key= (url) ->
  @App.goto(Eludia.Helpers.ApplicationHelpers.url(url_name))
