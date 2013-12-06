Eludia.Helpers.ApplicationHelpers =
  ficon: (name, attrs) ->
    "<i class='fontello-icon-#{name}'></i>"

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

  url: (url_name) ->
    App.urls[url_name] || "Неизвестный url_name #{url_name}"
