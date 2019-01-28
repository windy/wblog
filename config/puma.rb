if ENV['RAILS_ENV'] == 'production'
  app_root = '/data/www/wblog/shared'
  pidfile "#{app_root}/tmp/pids/puma.pid"
  state_path "#{app_root}/tmp/pids/puma.state"
  bind "unix://#{app_root}/tmp/sockets/puma.sock"
  activate_control_app "unix://#{app_root}/tmp/sockets/pumactl.sock"
  daemonize true
  workers 1
  threads 4, 8
  preload_app!

  stdout_redirect "#{app_root}/log/puma_access.log", "#{app_root}/log/puma_error.log", true

  on_worker_boot do
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::Base.establish_connection
    end
  end

  before_fork do
    ActiveRecord::Base.connection_pool.disconnect!
  end
else
  bind 'tcp://0.0.0.0:3000'
  plugin :tmp_restart
end
