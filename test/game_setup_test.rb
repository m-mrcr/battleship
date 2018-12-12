require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game_setup'

class GameSetupTest < MiniTest::Test

  def test_it_exists

    game = GameSetup.new
    assert_instance_of GameSetup, game

  end

  def test_it_has_a_human_and_a_computer_that_are_players
    game = GameSetup.new

    assert_instance_of Player, game.computer
    assert_instance_of Player, game.human

  end

  def test_all_ships_of_computer_get_placed
    game = GameSetup.new

    game.place_ships_ai

    expected = 5
    actual = game.computer.board.cells.values.count {|cell| !cell.empty? }

    assert_equal expected, actual
  end



end
