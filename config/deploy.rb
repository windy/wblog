require 'rvm/capistrano'
require 'bundler/capistrano'
#default_run_options[:shell] = '/bin/bash'
default_run_options[:pty] = true
set :application, "wblog"
set :repository,  "git://github.com/windy/wblog.git"
set :user, "ruby"
set :use_sudo, false

set :rvm_ruby_string, '1.9.3-p194'
set :rvm_type, :system
set :keep_releases, 5

set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "yafeilee.me"                          # Your HTTP server, Apache/etc
role :app, "yafeilee.me"                          # This may be the same as your `Web` server
role :db,  "yafeilee.me", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
#
set :deploy_to, "/home/ruby/app_wblog"


# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
