# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  config.before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
  
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
end
