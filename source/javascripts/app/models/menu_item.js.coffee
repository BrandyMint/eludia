class Eludia.Models.MenuItem extends Backbone.Model
  initialize: ->
    if @get('href') && @get('items')
      console.log "У пункта меню #{@debug()} есть и href и items, а должно быть что-то одно"

    if !@get('href') && !@get('items')
      console.log "У пункта меню #{@debug()} нет ни href, ни items, а должно быть что-то одно"

  debug: ->
    "##{@get('id')}[#{@get('label')}]"

