#  require_tree ./vendor
#  require_tree ./lib
#= require jquery/jquery.min
#= require jquery.role/lib/jquery.role.min
#= require hamlcoffee
#= require bootstrap
#= require momentjs/moment
#= require momentjs/lang/ru

#= require underscore/underscore-min
#= require backbone/backbone-min
#= require backbone.marionette/lib/backbone.marionette.min
#= require namespaces
#= require_tree ./app
#= require core

$ ->
  moment.lang('ru')

  #$(".collapse").collapse()
  #userAgent = navigator.userAgent
  #android = userAgent.match(/(Android)/g)
  #ios = userAgent.match(/(iPhone)/g) || userAgent.match(/(iPad)/g)
  #unless (ios || android)

