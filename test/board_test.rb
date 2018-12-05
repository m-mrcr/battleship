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



end
