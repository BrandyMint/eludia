class Eludia.Views.IframeView extends Marionette.ItemView
  template: JST["app/templates/iframe"]
  tagName: 'iframe'
  className: 'eludia-application-iframe'
  id: 'eludia-application-iframe'

  initialize: (options) ->
    _.extend @, Eludia.Helpers.ApplicationHelpers
    @options = options

  onShow: ->
    @setFullHeight @
    source = @options.src
    @$el.attr 'src', source
