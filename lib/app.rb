require 'sinatra/base'
require 'shotgun'
require 'capybara'
require 'selenium-webdriver'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/infra' do
    'Testing infrastructure working!'
  end

  post '/names' do
    @player_one = params[:player_one]
    @player_two = params[:player_two]
    erb :play
  end


end
