class HomeController < ApplicationController 
  get '/' do
    @courses = Course.all
    erb :index, :layout => :base
  end
end