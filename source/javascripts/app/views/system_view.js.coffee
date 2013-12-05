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
    user: '@eludia-navbar-user'

  onRender: ->
    @user_view = new Eludia.Views.UserView el: @ui.user, model: App.user
    @user_view.render()

  onClose: ->
    @user_view.close()

  toggleSuperpos: ->
    @.ui.superpos.toggleClass('active')
    @.ui.superpos_block.toggleClass('hide')
