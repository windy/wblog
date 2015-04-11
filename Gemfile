if ENV['RUBYTAOBAO']
  source 'http://ruby.taobao.org'
else
  source 'https://rubygems.org'
end

gem 'rails', '4.1.9'
#gem 'sprockets', '2.12.1'
gem 'sass-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'foundation-rails', '~> 5.5.1'
gem 'foundation-icons-sass-rails'
gem 'font-awesome-sass'

gem 'jbuilder'

gem 'mongoid'
gem 'mongoid-tree'
gem 'mongoid-pagination'
gem 'redcarpet'
gem 'rouge'
gem 'slim-rails'
gem 'simple_form'
gem 'mini_magick'
gem 'carrierwave-mongoid'
gem 'html_truncator'
gem 'nokogiri'
gem 'angularjs-rails'
gem 'figaro'
gem 'rqrcode-with-patches', require: 'rqrcode'
gem 'chunky_png'
gem 'sidekiq'
gem 'rest-client'
gem 'unicorn'
gem 'newrelic_rpm'

gem 'mina', require: false
gem 'mina-multistage', require: false
gem 'mina-sidekiq', require: false
gem 'mina-unicorn', require: false

group :development do
  gem 'spring'
  gem 'quiet_assets'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'rack-cors', :require => 'rack/cors'
end

group :test do
  gem 'capybara'
  gem 'mongoid-rspec', :require => false
  gem 'database_cleaner'
  gem 'rspec-sidekiq'
  gem "codeclimate-test-reporter", group: :test, require: nil
end

group :test, :development do
  gem "rspec-rails", ">= 2.8.1"
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'factory_girl_rails'
end
