require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class GameTest < MiniTest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game

  end

  def test_it_can_welcome
    game = Game.new
    binding.pry
    game.welcome
    binding.pry

    assert_equal
  end

end
