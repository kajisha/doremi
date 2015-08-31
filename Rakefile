require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'active_record'

RSpec::Core::RakeTask.new(:spec)

task default: %w(db:drop db:create spec)

namespace :db do
  task :create do
    connection.execute 'CREATE DATABASE pg_ops_test'
  end

  task :drop do
    connection.execute 'DROP DATABASE IF EXISTS pg_ops_test'
  end

  def connection
    ActiveRecord::Base.establish_connection adapter: 'postgresql', database: 'postgres', schema_search_path: 'public', template: 'template0'
    ActiveRecord::Base.connection
  end
end
