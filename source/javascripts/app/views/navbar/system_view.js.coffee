class Eludia.Views.SystemView extends Marionette.ItemView
  tagName: 'div'
  className: 'nav navbar-nav'
  template: JST["app/templates/navbar/system"]

  templateHelpers: -> Eludia.Helpers.ApplicationHelpers

