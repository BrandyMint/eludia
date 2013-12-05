class Eludia.Views.SystemView extends Marionette.ItemView
  tagName: 'div'
  className: 'nav navbar-nav'
  template: JST["app/templates/navbar/system"]

  templateHelpers: -> Eludia.Helpers.ApplicationHelpers

  events:
    'click @navbar-superpos-btn': 'toggleSuperpos'

  ui:
    superpos: '@navbar-superpos'
    superpos_btn: '@navbar-superpos-btn'
    superpos_block: '@navbar-superpos-block'

  bindings: 
    '@user_name': 'name'
    '@combination_state': 'state'
    '@combination_user_name': 'combination_name'

  onRender: ->
    @stickit()

  toggleSuperpos: ->
    @.ui.superpos.toggleClass('active')
    @.ui.superpos_block.toggleClass('hide')
