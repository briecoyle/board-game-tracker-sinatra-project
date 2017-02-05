require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash
  get '/' do
    erb :home
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/signup' do
    erb :'/users/signup'
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
      flash[:message] = "Please enter a valid username and password."
      redirect to '/login'
    end
  end

  post '/signup' do
    @user = User.create(params)
    if @user.valid?
      session[:id] = @user.id
      redirect to '/games/index'
    else
      flash[:message] = "Please enter a valid username and password."
      redirect to '/signup'
    end
  end
end
