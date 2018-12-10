require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'

class GameTest < MiniTest::Test

  def test_it_exists
    skip
    game = Game.new
    assert_instance_of Game, game

  end

  def test

  end

end
