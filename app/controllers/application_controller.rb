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

  get '/users/login' do
    erb :'/users/login'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/login' do

  end

  post '/users/signup' do

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
