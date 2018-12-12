require './lib/cell'
require './lib/ship'
require './lib/game_play'
require './lib/player'
require './lib/board'
require './lib/game_setup'
require 'pry'

game = GameSetup.new
game.welcome
gameplay = GamePlay.new(game.human, game.computer)
loop do
  gameplay.display_boards
  gameplay.player_chooses_coordinate
  gameplay.computer_chooses_coordinate

  if gameplay.computer_won == true || gameplay.player_won == true
    gameplay.display_boards
    gameplay.end_game_announcement
    game = GameSetup.new
    game.setup
    gameplay = GamePlay.new(game.human, game.computer)
  end
end
