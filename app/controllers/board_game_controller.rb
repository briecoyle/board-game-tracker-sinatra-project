class BoardGameController < ApplicationController

  get '/games/index' do
    @user = current_user
    erb :'/games/index'
  end

  get '/games/new' do
    if logged_in?
      erb :'/games/new'
    else
      redirect to '/login'
    end
  end

  post '/games/new' do
    @game = BoardGame.new
    @game.name = params[:name]
    @game.description = params[:description]
    @game.min_players = params[:min_players]
    @game.max_players = params[:max_players]
    if params[:party] == "on"
      @max.max_players = 11
    end
    @game.save
    @game.users << User.find[session[:id]]
    redirect to '/games/index'
  end

end
