class UserController < ApplicationController

  get '/' do
    erb :home
  end

  get '/login' do
    if logged_in?
      erb :'/games/index'
    else
      erb :'/users/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect to '/games/index'
    else
      erb :'/users/signup'
    end
  end

  post '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to '/games/index'
    else
      redirect to '/login'
    end
  end

  post '/signup' do
    @user = User.create(params)
    session[:id] = @user.id
    redirect to '/games/index'
  end
end
