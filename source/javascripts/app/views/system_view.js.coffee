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
    current_time: '@current-time'
    current_date: '@current-date'

  onRender: ->
    @user_view = new Eludia.Views.UserView el: @ui.user, model: App.user
    @current_time_controller = new Eludia.Controllers.TimeController el: @ui.current_time, format: 'H:mm'
    @current_date_controller = new Eludia.Controllers.TimeController el: @ui.current_date, format: 'D MMMM'
    @user_view.render()

  onClose: ->
    @user_view.close()
    @current_time_controller.close()
    @current_date_controller.close()

  #toggleSuperpos: ->
  #  @.ui.superpos.toggleClass('active')
  #  @.ui.superpos_block.toggleClass('hide')
