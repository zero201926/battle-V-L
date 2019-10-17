require 'sinatra/base'
require 'shotgun'
require 'capybara'
require 'selenium-webdriver'
require 'player'
require './lib/game'
require './lib/player'

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
    player_1 = Player.new(params[:player_one])
    player_2 = Player.new(params[:player_two])
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    # @player_one = $player_1
    # @player_two = $player_2
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player_2)
    @game.switch_turns
    erb :attack
  end

  post '/switch-turns' do
     $game.switch_turns
     redirect('/play')
   end
   # start the server if ruby file executed directly
   run! if app_file == $0
end
