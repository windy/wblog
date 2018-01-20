set :domain, 'yafeilee.me'
set :deploy_to, '/data/www/wblog_en'
set :repository, 'git@github.com:windy/wblog.git'
set :branch, 'master'
set :user, 'ruby'
set :puma_config, ->{ "#{fetch(:current_path)}/config/puma_en.rb" }
