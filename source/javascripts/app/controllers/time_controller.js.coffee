class Eludia.Controllers.TimeController extends Marionette.Controller
  initialize:(options)->
    @el = options.el
    @format = options.format
    @interval = options.interval || 1000

    @update_el()

    @timeIntervalHandler = setInterval =>
      @update_el()
    , @interval

  update_el: ->
    @el.text moment().format(@format)

  onClose: ->
    clearInterval(@timeIntervalHandler)


