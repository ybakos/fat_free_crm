set :rails_env, 'staging'
set :application, 'spectrum.humanoriented.com'
set :deploy_to, "/home/humorsys/#{application}"
set :user, 'humorsys'
set :use_sudo, false
server 'spectrum.humanoriented.com', :app, :web, :db, :primary => true

namespace :deploy do

  desc 'Linking shared assets to relevant application paths.'
  task :link_assets, :except => { :no_release => true } do
    run "ln -s #{shared_path}/public/avatars #{latest_release}/public/avatars"
    run "ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
end

after 'deploy:finalize_update', 'deploy:link_assets'
