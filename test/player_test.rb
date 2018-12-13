require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/player'

class PlayerTest < MiniTest::Test
  def test_it_exists
    human = Player.new("Teresa")

    assert_instance_of Player, human
  end

  def test_computer_places_five_ships
    computer = Player.new("computer")
    computer.place_ships_ai

    expected = 5
    actual = computer.board.cells.values.count {|cell| !cell.empty? }

    assert_equal expected, actual

  end




end
