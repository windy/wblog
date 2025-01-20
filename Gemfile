source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'rails', '~> 7.0.8.7'
gem 'puma', '~> 5'
gem 'turbo-rails'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'stimulus-rails'

gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'propshaft', '~> 1.1.0'

gem 'rexml', '~> 3.2', '>= 3.2.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.9'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'pg', '>= 1.1'
gem 'concurrent-ruby', '1.3.4'

gem 'carrierwave'
gem 'redcarpet'
gem 'rouge'
gem 'mini_magick'
gem 'html_truncator'
gem 'nokogiri'

gem 'figaro'
gem 'simple_form', '~> 5.0'
gem 'slim-rails'
gem 'high_voltage', '~> 3.1'
# gem 'browser_warrior', '>= 0.11.0'
gem 'sidekiq', '~> 5'
gem 'bcrypt'
gem 'kaminari', github: 'kaminari/kaminari'
gem 'rails-i18n', '~> 7.0.10'
gem 'mina', '~> 1.2.2', require: false
gem 'mina-ng-puma', '>= 1.4.0', require: false
gem 'mina-multistage', require: false
gem 'mina-sidekiq', require: false
gem 'mina-logs', require: false

group :development do
  gem 'rails_apps_testing'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
