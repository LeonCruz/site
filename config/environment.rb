require 'sinatra'
require 'byebug'
require 'mongoid'
require 'require_all'


configure :testing do
  Mongoid.load!('config/mongoid.yml', :testing)
end

configure :development do
  Mongoid.load!('config/mongoid.yml', :development)
end

require_all 'app'
