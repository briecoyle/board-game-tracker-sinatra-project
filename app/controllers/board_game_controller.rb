class BoardGameController < ApplicationController

  get '/games/index' do
    @user = current_user
    erb :'/games/index'
  end

  get '/games/new' do
    erb :'/games/new'
  end

end
