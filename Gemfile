if ENV['RAILS_ENV'] == 'production'
  source 'https://rubygems.org'
else
  source 'http://ruby.taobao.org'
end

ruby '2.0.0'

gem 'rails', '4.0.4'
gem 'sass-rails', '~> 4.0.2'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem "mongoid"
gem "mongoid-pagination"
gem "bson_ext"
gem "redcarpet"
gem "simple_form"
gem "mini_magick"
gem 'carrierwave-mongoid'
gem 'html_truncator'
gem 'nokogiri'

group :development do
  gem 'quiet_assets'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
end

group :test do
  gem 'capybara'
  gem 'factory_girl'
  gem 'mongoid-rspec', :require => false
  gem 'database_cleaner'
end

group :test, :development do
  gem "rspec-rails", ">= 2.8.1"
end
