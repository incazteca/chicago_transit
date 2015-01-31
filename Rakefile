# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :db do
  desc 'drop, create, migrate, seed db'
  task :setup_db => %w('db:drop' 'db:create' 'db:migrate' 'db:seed')
end
