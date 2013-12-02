#  require_tree ./vendor
#  require_tree ./lib
#= require jquery/jquery.min
#= require jquery.role/lib/jquery.role.min
#= require hamlcoffee
#= require bootstrap
#= require momentjs/moment

#= require underscore/underscore-min
#= require backbone/backbone-min
#= require backbone.marionette/lib/backbone.marionette.min
#= require namespaces
#= require_tree ./app
#= require core

$ ->
  #$(".collapse").collapse()
  userAgent = navigator.userAgent
  android = userAgent.match(/(Android)/g)
  ios = userAgent.match(/(iPhone)/g) || userAgent.match(/(iPad)/g)
  lastScrollTop = 0
  unless (ios || android)
    $(window).on 'scroll', (event) ->
      st = $(this).scrollTop()
      if st > 100
        if st >= lastScrollTop || st == 0
          @showNavbar()
          # downscroll code
        else
          @hideNavbar()
          # upscroll code
      else
        #@showNavbar()
      lastScrollTop = st

  $('.navbar-collapse a')
    .on 'click', (e) ->
      $(@).parents('.navbar-collapse').collapse('toggle')
      @hideNavbar()


@showNavbar = ->
  $('.application-navbar.navbar-fixed-top').delay(200).addClass('transparent')

@hideNavbar = ->
  $('.application-navbar.navbar-fixed-top').removeClass('transparent')


