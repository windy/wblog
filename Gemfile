source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 2.7.2'

gem 'jquery-rails'
gem 'foundation-rails', '~> 6.2.1'
gem 'foundation-icons-sass-rails'
gem 'font-awesome-sass', '4.7.0'
gem 'carrierwave'
gem 'kaminari'
gem 'turbolinks', '~> 5.x'
gem 'js_cookie_rails'

gem 'rails-i18n', '~> 5.1'

gem 'jbuilder'
gem 'pg', '~> 0.18'

gem 'redcarpet'
gem 'rouge'
gem 'slim-rails'
gem 'simple_form', '~> 4.0.0'
gem 'mini_magick'
gem 'html_truncator'
gem 'nokogiri'
gem 'figaro'
gem 'sidekiq'
gem 'redis-namespace'
gem 'rest-client'
gem 'mysql2', '~> 0.4.8'

gem 'puma'
gem 'bootsnap', '>= 1.3.0', require: false

gem 'mina', '~> 1.0.6', require: false
gem 'mina-puma', '~> 1.0.1', require: false
gem 'mina-multistage', '~> 1.0.3', require: false
gem 'mina-sidekiq', '~> 1.0.1', require: false
gem 'mina-logs', '~> 1.0.1', require: false

gem 'browser_warrior'

group :development do
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'listen', '~> 3.x'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rack-cors', :require => 'rack/cors'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-sidekiq'
  gem "codeclimate-test-reporter", group: :test, require: nil
  gem 'simplecov'
  gem 'simplecov-console'
end

group :test, :development do
  gem "rspec-rails", ">= 2.8.1"
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end
