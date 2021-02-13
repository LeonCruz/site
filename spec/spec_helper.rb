require 'rspec'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL
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