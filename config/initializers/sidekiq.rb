Sidekiq.configure_server do |config|
    config.redis = { :namespace => ENV['REDIS_NAMESPACE'] }
end

Sidekiq.configure_client do |config|
    config.redis = { :namespace => ENV['REDIS_NAMESPACE']}
end
