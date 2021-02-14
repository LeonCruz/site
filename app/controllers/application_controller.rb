require 'sinatra'
require 'sinatra/contrib'

class ApplicationController < Sinatra::Base
  set :views, 'app/views'
  set :public_dir, 'app/public'
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end
end
