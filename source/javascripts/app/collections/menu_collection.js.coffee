#= require app/models/menu_item
#= require_self
#
class Eludia.Collections.MenuCollection extends Backbone.Collection
  model: Eludia.Models.MenuItem
