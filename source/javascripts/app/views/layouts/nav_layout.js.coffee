class Eludia.Views.NavLayout extends Marionette.Layout
  template: JST['app/templates/layout']
  regions:
    system: '@navbar-system'
    menu: '@navbar-menu'
    iframe: '@eludia-application-iframe-container'

  initialize: ->
    _.extend @, Eludia.Helpers.ApplicationHelpers

  events:
    #'click a[data-target="iframe"]' : 'iframeLocation'
    'click a' : 'iframeLocation'

  iframeLocation: (e) ->
    link = e.currentTarget
    e.preventDefault()
    unless link.hasAttribute('target') && link.attr('target').contains('blank')
      e.preventDefault()
      e.stopPropagation()
      @iframe_show link.href



