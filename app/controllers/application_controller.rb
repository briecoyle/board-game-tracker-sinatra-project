class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "secret"
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find(session[:id])
    end
  end
end
