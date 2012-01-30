set :stages, %w(edge staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "Eventstreams"
set :repository,  "git@github.com:stefang/eventstreams2.git"
set :branch, "master"

set :scm, :git

set(:deploy_to) { "/srv/www/#{stage}.eventstreamsapp.com" }
set :deploy_via, :remote_cache

server "eventstreamsapp.com", :app, :web, :db, :primary => true

set :user, "deploy"
set :group, "www-data"
set :scm_username, "stefang"

set :use_sudo, false
set :scm_verbose, true

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end