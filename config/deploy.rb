set :stages, %w(en zh)
set :default_stage, 'zh'

require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'
require 'mina_sidekiq/tasks'
require 'mina/logs'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'config/application.yml', 'log', 'tmp', 'public/uploads', 'public/personal' ]

task :environment do
  invoke :'rvm:use[2.3.1]'
end

task :setup => :environment do
  ['config', 'log', 'tmp', 'public/uploads', 'public/personal'].each do |dir|
    queue! %[mkdir -p "#{deploy_to}/shared/#{dir}"]
    queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/#{dir}"]
  end

  ['config/database.yml', 'config/application.yml'].each do |file|
    queue! %[touch "#{deploy_to}/shared/#{file}"]
    queue  %[echo "-----> Be sure to edit 'shared/#{file}'."]
  end

  queue! %[mkdir -p "#{deploy_to}/shared/pids/"]
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[mkdir -p "#{deploy_to}/shared/log/"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      # Insure puma is start when restart it
      invoke :'puma:start'
      invoke :'puma:phased_restart'
      invoke :'sidekiq:restart'
    end

    invoke :'deploy:cleanup'
  end
end
