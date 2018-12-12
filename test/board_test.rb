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

    assert board.cells.values.all? do |value|
      value.class == Cell
    end
  end

  def test_it_can_tell_if_a_coordinate_is_in_the_board

    board = Board.new
    board.cells

    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_it_can_validate_coordinate_as_false

    board = Board.new
    board.cells

    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_can_validate_coordinate_as_true
    board = Board.new
    board.cells

    assert_equal true, board.are_the_coordinates_in_the_board?(["A1", "B2", "C4"])
    assert_equal false, board.are_the_coordinates_in_the_board?(["A6", "B2", "D1"])
  end

  def test_it_can_get_horizontal_orientation
    board = Board.new

    assert_equal :horizontal, board.get_orientation(["A1", "A2", "A3"])
  end


  def test_it_can_get_vertical_orientation
    board = Board.new

    assert_equal :vertical, board.get_orientation(["A1", "B1", "C1"])
  end

  def test_it_cannot_have_ships_in_diagonal_orientation
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
  end

  def test_that_coordinates_need_to_be_same_length_as_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
  end

  def test_that_in_valid_placement_coordinates_and_placement_match_ship_length

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
  end

  def test_that_in_valid_placement_coordinates_and_placements_are_consecutive

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])

    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_it_can_place_a_ship

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    board.place(cruiser, ["A1", "A2", "A3"])


    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship

    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_it_can_tell_if_there_are_already_ships_in_a_set_of_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal true, board.are_there_already_ships_here?(["A1", "A2", "A3"])
  end

  def test_it_cannot_have_overlapping_ships

    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    board.place(cruiser, ["A1", "A2", "A3"])

    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
  end

  def test_it_can_validate_array_of_coordinates
    board = Board.new

    assert_equal true, board.are_the_coordinates_in_the_board?(["A2", "B4", "C1"])
    assert_equal false, board.are_the_coordinates_in_the_board?(["C2", "D3", "D5"])
  end

  def test_it_can_render

    board = Board.new

    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . ."



    assert_equal expected, board.render

  end





end
