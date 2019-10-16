require 'sinatra/base'
require 'shotgun'
require 'capybara'
require 'selenium-webdriver'
require 'player'
class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/infra' do
    'Testing infrastructure working!'
  end

  post '/names' do
    # session[:player_one] = params[:player_one]
    # session[:player_two] = params[:player_two]
    $player_1 = Player.new(params[:player_one])
    $player_2 = Player.new(params[:player_two])
    redirect '/play'
  end

  get '/play' do
    @player_one = $player_1
    @player_two = $player_2
    erb :play
  end

  get '/attack' do
    @player_one = $player_1
    @player_two = $player_2
    @player_one.attack(@player_two)
    # Game.new.attack(@player_2)
    p @player_two
    erb :attack
  end
end
