#= require jquery/jquery
#= require modernizr/modernizr
#= require bootstrap
#= require underscore/underscore
#= require backbone/backbone
#= require backbone.marionette/lib/backbone.marionette

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


