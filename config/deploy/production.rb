#Конфиг деплоя на production
server '', :app, :web, :db, :primary => true
set :branch, "master" unless exists?(:branch)
