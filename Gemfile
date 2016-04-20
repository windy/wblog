source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 2.7.2'

gem 'jquery-rails'
gem 'foundation-rails', '~> 6.2.1'
gem 'foundation-icons-sass-rails'
gem 'font-awesome-sass'
gem 'angularjs-rails'

gem 'jbuilder'
gem 'pg'

gem 'redcarpet'
gem 'rouge'
gem 'slim-rails'
gem 'simple_form'
gem 'mini_magick'
gem 'html_truncator'
gem 'nokogiri'
gem 'figaro'
gem 'rqrcode-with-patches', require: 'rqrcode'
gem 'chunky_png'
gem 'sidekiq'
gem 'redis-namespace'
gem 'rest-client'
gem 'newrelic_rpm'

gem 'unicorn'

gem 'mina', require: false
gem 'mina-multistage', require: false
gem 'mina-sidekiq', require: false
gem 'mina-unicorn', require: false

group :development do
  gem 'quiet_assets'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rack-cors', :require => 'rack/cors'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec-sidekiq'
  gem "codeclimate-test-reporter", group: :test, require: nil
end

group :test, :development do
  gem "rspec-rails", ">= 2.8.1"
  gem 'pry-rails'
  gem 'pry-nav'
  #gem 'factory_girl_rails'
end
