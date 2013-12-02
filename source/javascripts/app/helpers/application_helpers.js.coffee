Eludia.Helpers.ApplicationHelpers =
  ficon: (name, attrs) ->
    "<i class='fontello-icon-#{name}'></i>"

  label: (text, type) ->
    "<span class=\"label label-#{if type then type else "default"}\">#{text}</span>"

  badge: (text, type) ->
    "<span class=\"badge badge-#{if type then type else "default"}\">#{text}</span>"

  truncate: (string, size=100) ->
    return string if string.length < size
    words_array = $.trim(string).substring(0, size).split(' ')
    new_string = words_array.join(" ") + "&hellip;"
    if new_string.length > size
      words_array.slice(0, -1).join(" ") + "&hellip;"
    else
      new_string

