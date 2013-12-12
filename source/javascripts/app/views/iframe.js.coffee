class Eludia.Views.IframeView extends Marionette.View
  tagName: 'iframe'
  className: 'eludia-application-iframe'
  id: 'eludia-application-iframe'

  initialize: ->
    _.extend @, Eludia.Helpers.ApplicationHelpers

  onShow: ->
    @setFullHeight @

