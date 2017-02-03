class BoardGameController < ApplicationController

  get '/games/index' do
    @user = current_user
    erb :'/games/index'
  end

end
