# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra', '~> 2.1'

gem 'mongoid', '~> 7.2'

gem 'require_all', '~> 3.0'

gem 'sinatra-contrib', '~> 2.1'

gem 'bcrypt', '~> 3.1'


group :development do
  gem "solargraph", "~> 0.40.3"
end

group :development, :test do
  gem 'byebug', '~> 11.1'
  gem 'capybara', '~> 3.35'
  gem 'cuprite', '~> 0.11'
  gem 'rspec', '~> 3.10'
  gem 'rubocop', '~> 1.9'
  gem "factory_bot", "~> 6.1"
end

group :test do
  gem "faker", "~> 2.16.0"
end

