class Eludia.Views.UserView extends Marionette.ItemView
  templateHelpers: -> Eludia.Helpers.ApplicationHelpers
  bindings: 
    '@user_name': 'name'
    '@combination_state': 'state'
    '@combination_user_name': 'users_twins_name'

  onRender: ->
    @stickit()

  getTemplate: ->
    JST["app/templates/user/#{@model.get('state')}"]
