require 'sinatra/base'
require 'shotgun'
require 'capybara'
require 'selenium-webdriver'
require_relative 'player'
require_relative 'game'


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

  post '/attack' do
    # Attack.run($game.opponent_of($game.current_turn))
    if $game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get '/attack' do
    @game = $game
    # if @game.current_turn == @game.player_1
    #   @game.attack(@game.player_2)
    # else
    #   @game.attack(@game.player_1)
    # end
    @game.attack(@game.opponent_of(@game.current_turn))
    @game.switch_turns
    erb :attack
  end

  post '/switch-turns' do
     # $game.switch_turns
    redirect('/play')
  end

  get '/game-over' do
    @game = $game
    erb :game_over
  end
   # start the server if ruby file executed directly
   run! if app_file == $0
end
