require 'rubygems'
require 'bundler'
Bundler.setup(:deploy)

load 'deploy'

set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "" # set application name
set :user,      'wwwapplication' # set user
set :deploy_to,  defer {"/home/#{user}/#{application}" }

set :scm, :git
set :repository,  "" # this project repo here

set :deploy_via, :copy
set :copy_cache, true
set :copy_exclude, Dir.entries(".") - %w(. .. build)
set :copy_compression, :gzip

set :use_sudo, false
set :normalize_asset_timestamps, false
set :keep_releases, 5

set :build_script, 'bower install; rm -rf build/*; bundle exec middleman build'

after 'deploy:finalize_update', 'application:create_symlink'
after 'deploy', "deploy:cleanup"

namespace :application do
  task :create_symlink do
    run("rm -rf #{latest_release}/public; ln -s #{latest_release}/build #{latest_release}/public")
  end
end
