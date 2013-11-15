# Brandymint static site
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

## Deploy

`cap deploy`

Работает авто-деплой из jenkins-а

---

## What to do?
- Migrate all data to yml
- Large texts in markdown (use redcarpet)
- Locale switch
- Russian content
