require 'rspec'
require 'factory_bot'
require 'capybara/rspec'
require 'faker'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.definition_file_paths = %w{./spec/factories}
    FactoryBot.find_definitions
  end

  config.after(:each) do
    Mongoid.purge!
  end
end

def app
  Rack::Builder.parse_file('config.ru').first
end

ENV['RACK_ENV'] = 'testing'
Bundler.require :default, ENV['RACK_ENV'].to_sym

Capybara.app = app