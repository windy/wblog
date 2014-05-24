Sidekiq.configure_server do |config|
    config.redis = { :namespace => 'wblog' }
end

Sidekiq.configure_client do |config|
    config.redis = { :namespace => 'wblog' }
end
