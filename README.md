# Eludia redesign static site
------

## Development

`bundle install` first.

`bundle exec middleman` starts a server on `0.0.0.0:4567` (liveupdate included).

`bundle exec middleman build --verbose` builds a static site in `build` folder.

---

## Data and content

`models` folder contains models.

Data is stored in `data` folder in .yml files — *in process*

Access data in templates with `= data.yml_file.key...` objects, like `= data.projects.first.title`

## Развёртывание на eludia.icfdev.ru

  middleman deploy

Работает авто-деплой ветки master из jenkins-а

---
