require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

require_relative 'config/application'

desc 'Look for style guide offenses'
task :rubocop do
  sh 'rubocop --format simple || true'
end

task default: [:rubocop, :spec]

desc 'Open an irb session preloaded with the environment'
task :console do
  require 'rubygems'
  require 'pry'

  Pry.start
end

# Active Record related rake tasks
db_namespace = namespace :db do
  desc 'create the database'
  task :create do
    puts "Creating #{db_path}..."
    touch db_path
  end

  desc 'drop the database'
  task :drop do
    puts "Deleting #{db_path}..."
    rm_f db_path
  end
end
