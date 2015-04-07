require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"
Bundler.require(:default, Rails.env)

module WBlog
  class Application < Rails::Application

    # Configure sensitive parameters which will be filtered from the log file.
    config.i18n.available_locales = [:en, :'zh-CN']
    #I18n.config.enforce_available_locales = true
    config.i18n.default_locale = (ENV['LOCALE'] || 'zh-CN').to_sym
    config.time_zone = 'Beijing'
    config.action_controller.action_on_unpermitted_parameters = :log

    config.filter_parameters += [ :password ]

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
