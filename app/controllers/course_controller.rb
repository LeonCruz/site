class CourseController < ApplicationController
  get '/curso/:uuid' do |uuid|
    @course = Course.find_by(uuid: uuid)
    erb :single, :layout => :base
  end
end