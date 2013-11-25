#Конфиг деплоя на staging
server '', :app, :web, :db, :primary => true
set :application, ""
set(:current_branch) { `git branch`.match(/\* (\S+)\s/m)[1] || raise("Couldn't determine current branch") }
set :branch, defer { current_branch } unless exists?(:branch)

