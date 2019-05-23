set :domain, 'yafeilee.com'
set :deploy_to, '/data/www/wblog'
set :repository, 'git@github.com:windy/wblog.git'
set :branch, 'master'
set :user, 'ruby'
set :puma_config, ->{ "#{fetch(:current_path)}/config/puma.rb" }
