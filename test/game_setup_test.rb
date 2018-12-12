require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game_setup'
require './lib/player'

class GameTest < MiniTest::Test

  def test_it_exists
    game = GameSetup.new

    assert_instance_of Game, game
  end

  def test_it_has_a_human_player_and_a_computer_player
    game = GameSetup.new

    computer = Player.new(:computer)
    human = Player.new(:human)

    assert_equal computer_1, game.computer
    assert_equal human, game.human
  end



end
