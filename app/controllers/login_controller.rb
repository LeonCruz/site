class LoginController < ApplicationController
  get '/entrar' do
    erb :login, layout: :base
  end

  post '/entrar' do
    begin
      @user = User.find_by(email: params[:email])
    rescue Mongoid::Errors::DocumentNotFound
      session[:error_email] = 'Email não encontrado'
      redirect '/entrar'
    end

    if @user.password == params[:password]
      session[:user] = @user
      redirect '/'
    else
      session[:error_password] = 'A senha está incorreta'
      redirect '/entrar'
    end
  end

  get '/sair' do
    session[:user] = nil
    redirect '/'
  end
end
