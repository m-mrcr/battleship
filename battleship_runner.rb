require './lib/cell'
require './lib/ship'
require './lib/turn'
require './lib/player'
require './lib/board'
require './lib/game'
require 'pry'

game = Game.new
game.setup
turn = Turn.new(game.human, game.computer)
loop do
  turn.display_boards
  turn.player_chooses_coordinate
  turn.computer_chooses_coordinate

  if turn.computer_won == true || turn.player_won == true
    turn.end_game_announcement
  break
  end
end
