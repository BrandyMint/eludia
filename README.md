# Eludia static site
------

## Установка


`bundle install`

`bower install`


## Запуск

`bundle exec middleman` starts a server on `0.0.0.0:4567` (liveupdate included).

`bundle exec middleman build` builds a static site in `build` folder.

---

## Развёртывание на eludia.icfdev.ru

  middleman deploy

## Ссылки:

* трелло https://trello.com/b/L2ipO6wF/eludia
* [дизайн](https://docs.google.com/file/d/0B1A2sA77jfTZdEpUQ1hQbnFFNW8/edit)

## Автодеплой

Работает авто-деплой ветки master из jenkins-а

## Запуск js-приложения

```
// параметры
  window.options = {
      container: "#eludia-application-menu",  // dom-элемент, в который рендерится приложение
      urls: { // url'ы для меню
        logout: '/auth',  // выйти, страница логина
        settings: '/settings',  // настройки
        help: 'http://hixie.ch/tests/adhoc/compat/mozilla/001.cgi?DOCTYPE=&MODE=full&EXPECT=quirks%20mode', // страница "помощь"
        logo: '/sample', // ссылка с логотипа в верхем меню, она же — стартовая страница
        combination_cancel: '/combination_cancel', // url для выключения режима совмещения
        combination_setup: '/combination_setup' // url для включения режима совмещения (выбора пользователя)
      },
      user: {
         name: "Иванов В.И.", // текущий пользователь
         state: "enabled",  // denied, combinated
            // состояние режима совмещения:
            // enabled — доступен, denied — недоступен, combinated — в режиме совмещения
         // combination_name: "Васильев А.Г." // пользователь режима совмещения
       }
    }
```
```
// запуск
  $(function() {
    $.getJSON("menu.json", function(data) { // menu.json — файл со структурой основного меню
      window.options.menu = data;
      window.Eludia.App.start(window.options);
    });
  });
```

## Debug

`http://localhost:4567/?no_blur` не закрывается меню при убирании с него
фокуса
