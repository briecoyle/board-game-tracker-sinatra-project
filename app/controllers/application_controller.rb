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
      @current_user ||= User.find(session[:id]) if session[:id]
    end

    def redirect_for_logged_in
      redirect to '/' if logged_in?
    end

    def redirect_for_logged_out
      if !logged_in?
        flash[:message] = "You are not logged in."
        redirect to '/login' if !logged_in?
      end
    end
    
  end
end
