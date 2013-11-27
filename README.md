# Brandymint static site
------

## Development

`bundle install` first.

`bundle exec middleman` starts a server on `0.0.0.0:4567` (liveupdate included).

`bundle exec middleman build` builds a static site in `build` folder.

---

## Data and content

`models` folder contains models.

Data is stored in `data` folder in .yml files — *in process*

Access data in templates with `= data.yml_file.key...` objects, like `= data.projects.first.title`

## Развёртывание на eludia.icfdev.ru

  middleman deploy

## Ссылки:

https://trello.com/b/L2ipO6wF/eludia


## Автодеплой

Работает авто-деплой ветки master из jenkins-а

## What to do?
- Migrate all data to yml
- Large texts in markdown (use redcarpet)
- Locale switch
- Russian content
