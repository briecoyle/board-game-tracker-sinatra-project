require 'rack-flash'

class BoardGameController < ApplicationController
  use Rack::Flash

  get '/games' do
    redirect_for_logged_out
    erb :'/games/index'
  end

  get '/games/new' do
    redirect_for_logged_out
    erb :'/games/new'
  end

  get '/games/add' do
    redirect_for_logged_out
    erb :'/games/add'
  end

  get '/games/:slug' do
    @game = BoardGame.find_by_slug(params[:slug])
    @users = @game.users.uniq
    erb :'/games/show'
  end

  post '/games/new' do
    redirect_for_logged_out
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
    redirect to '/games'
  end

  post '/games/add' do
    @user = current_user
    @user.board_game_ids += params[:games]
    flash[:message] = "Games have been added."
    redirect to '/games'
  end

  post '/games/:slug' do
    @game = BoardGame.find_by_slug(params[:slug])
    redirect_for_logged_out
    @user = current_user
    if @user.board_games.include?(@game)
      flash[:message] = "Silly goose! You already have that game."
      redirect to "/games"
    else
      @user.board_games << @game
      flash[:message] = "That game has been added."
      redirect to '/games'
    end
  end
end
