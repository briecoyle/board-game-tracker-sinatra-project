class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/users/index' do
    @user = current_user
    erb :'/users/index'
  end

  get '/users/login' do
    if !logged_in?
      erb :'/users/login'
    else
      erb :'games/index'
    end
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to '/games/index'
    else
      redirect to '/users/login'
    end
  end

  post '/users/signup' do
    redirect to '/games/index'
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end
end
