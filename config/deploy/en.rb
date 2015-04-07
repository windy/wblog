set :domain, 'yafeilee.me'
set :deploy_to, '/home/ruby/wblog_en'
set :repository, 'git@github.com:windy/wblog.git'
set :branch, 'master'
set :user, 'ruby'
set :unicorn_config, -> { "#{deploy_to}/#{current_path}/config/unicorn/en.rb" }
