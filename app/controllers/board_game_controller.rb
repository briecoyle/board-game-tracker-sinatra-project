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

  get '/games/add' do
    erb :'/games/add'
  end

  get '/games/:slug' do
    @game = BoardGame.find_by_slug(params[:slug])
    @users = @game.users
    erb :'/games/show'
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
    @game.users << current_user
    redirect to '/games/index'
  end

  post '/games/add' do
    @user = current_user
    @user.board_game_ids += params[:games]
    redirect to '/games/index'
  end

  post '/games/:slug' do
    @game = BoardGame.find_by_slug(params[:slug])
    if logged_in?
      @user = current_user
      if @user.board_games.include?(@game)
        redirect to "/games/index"
      else
        @user.board_games << @game
        redirect to '/games/index'
      end
    else
      redirect to "games/#{@game.slug}"
    end
  end
end
