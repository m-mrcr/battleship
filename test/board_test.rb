require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < MiniTest::Test
  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_that_cells_are_a_hash

    board = Board.new
    assert_instance_of Hash, board.cells
  end

  def test_that_there_16_cells_in_board

    board = Board.new
    assert_equal 16, board.cells.count
  end

  def test_that_coordinates_map_to_cells
    board = Board.new
    board.cells.values.all? do |value|
      value.class == Cell
    end
  end

  def test_that_validates_coordinates_true
    board = Board.new
    board.cells

    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_that_validates_coordinates_false
    board = Board.new
    board.cells

    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_that_coordinates_and_placement_match_ship_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
  end

  def test_that_coordinates_and_placement_match_longer_ship_length
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
  end

  def test_that_coordinates_and_placements_are_consecutive
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_it_can_get_horizontal_orientation

    board = Board.new

    assert_equal :horizontal, board.get_orientation(["A1", "A2", "A3"])
  end



end
