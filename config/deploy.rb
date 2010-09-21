require 'capistrano/ext/multistage'
require 'lib/git-deployment/gitflow.rb'

set :repository,  'git@github.com:ybakos/fat_free_crm.git'
set :scm, :git
set :deploy_via, :remote_cache
default_run_options[:pty] = true

# Override default tasks, since we're using Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end