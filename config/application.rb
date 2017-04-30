require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.available_locales = [:en, :'zh-CN']
    config.i18n.default_locale = (ENV['LOCALE'] || 'zh-CN').to_sym
    config.time_zone = 'Beijing'

    config.action_controller.action_on_unpermitted_parameters = :log

    # generators
    config.generators.assets = false
    config.generators.helper = false
    config.generators do |g|
      g.test_framework :rspec, view_specs: false
    end

    # action mailer
    config.action_mailer.preview_path = "#{Rails.root}/spec/mailers/previews"
  end
end
