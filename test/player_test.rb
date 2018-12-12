require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/turn'

class PlayerTest < MiniTest::Test
  def test_it_exists
    human = Player.new("Teresa")

    assert_instance_of Player, human
  end





end
