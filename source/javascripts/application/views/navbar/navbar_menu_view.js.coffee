class Eludia.Views.NavbarMenuView extends Marionette.CollectionView
  tagName: 'ul'
  className: 'nav navbar-nav'
  itemView: Eludia.Views.NavbarMenuItemView

  appendHtml: (collectionView, itemView, index) ->
    collectionView.$el.append itemView.el
