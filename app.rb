require_relative 'config/environment'

class GameApp < Sinatra::Base
  get '/rps/:play' do |play|
    # Your app code goes here
    game = RPSGame.new(play.to_sym)
    game.computer_play
    
    @play = game.play
    @computer_play = game.comp_play

    if game.won? 
      @result = "You won!"
    elsif game.tied?
      @result = "Game tied."
    else
      @result = "You lost :("
    end

    erb :rps_game
  end
end
