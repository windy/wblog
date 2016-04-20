require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module WBlog
  class Application < Rails::Application

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
