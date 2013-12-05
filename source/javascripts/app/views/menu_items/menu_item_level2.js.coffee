class Eludia.Views.MenuItemLevel2 extends Eludia.Views.MenuItem
  onRender: ->
    if @model.get('items')
      @$el.addClass('node')
