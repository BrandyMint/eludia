class Eludia.Models.MenuItem extends Backbone.Model
  initialize: ->
    @set 'title', @get('label')
    if @get('href') && @get('items')
      console.log "У пункта меню #{@debug()} есть и href и items, а должно быть что-то одно"
      @set 'title', @get('title') + ' <i>(both href and items)</i>'

    if !@get('href') && !@get('items')
      console.log "У пункта меню #{@debug()} нет ни href, ни items, а должно быть что-то одно"
      @set 'title', @get('title') + ' <i>(ho href or items)</i>'



  debug: ->
    "##{@get('id')}[#{@get('label')}]"

