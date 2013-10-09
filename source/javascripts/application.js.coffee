#  require_tree ./vendor
#  require_tree ./lib
#= require jquery/jquery.min
# require jquery-mobile
#= require bootstrap

$ ->
  #$(".collapse").collapse()
  #console.log 'application.js.coffee loaded'
  #$(document).on 'scroll', (e) ->

  lastScrollTop = 0
  $(window).on 'scroll', (event) ->
    st = $(this).scrollTop()
    if st > 300
      if st >= lastScrollTop || st == 0
        @showNavbar()
        # downscroll code
      else
        @hideNavbar()
        # upscroll code
      lastScrollTop = st
    else
      @showNavbar()

  $('.navbar-collapse a')
    .on 'click', (e) ->
      $(@).parents('.navbar-collapse').collapse('toggle')
      @hideNavbar()


@showNavbar = ->
  $('.application-navbar').delay(200).addClass('transparent')

@hideNavbar = ->
  $('.application-navbar').removeClass('transparent')


